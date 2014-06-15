# -------------------------------------------------------------
# Base controller for front application
# -------------------------------------------------------------
class FrontendController < ApplicationController

  before_filter :bootstrap

  private

  # -------------------------------------------------------------
  # Fetch stores, categories, order, order items and
  # other needle data
  # -------------------------------------------------------------
  def bootstrap
    # TODO: Cache it!
    # Set up current order
    @order = session[:order_id] ? Sap::Order.find(session[:order_id]) : nil

    ## Data client
    @stores = Sap::Store.active
    @categories = gon.categories = Rails.cache.fetch('categories') { categoty_tree }
  end

  # Fetch categories
  def categoty_tree
    all = {}
    roots = Sap::Category.menu.roots
    roots.each do |item|
      all[item.id] = {
          url: item.url,
          name: item.name,
          parent_id: nil
      }
      item.children.each do |child|
        next unless child.show_in_menu
        all[child.id] = {
            url: child.url,
            name: child.name,
            parent_id: item.id
        }
      end
    end

    all
  end

end

