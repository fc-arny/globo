# -------------------------------------------------------------
# Base controller for front application
# -------------------------------------------------------------
class FrontendController < ApplicationController

  before_filter :bootstrap

  private

  # -------------------------------------------------------------
  # Fetch categories, order, order items and other needle data
  # -------------------------------------------------------------
  def bootstrap
    # Set up current order
    @order = session[:order_id] ? Sap::Order.find(session[:order_id]) : nil

    ## Data client
    @stores = Sap::Store.active
    @categories = gon.categories = category_tree
  end

  # Fetch all categories
  def category_tree
    Rails.cache.fetch([:menu, :category, :tree], expires_in: 1.day) do
      all = {}
      roots = Sap::Category.menu.roots
      roots.each do |item|
        all[item.id] = {id: item.id, url: item.url, name: item.name, parent_id: nil }

        item.children.menu.each do |child|
          children = child.children.menu.map do |i|
            {id: i.id, url: i.url, name: i.name, parent_id: i.id }
          end
          all[child.id] = {id: child.id, url: child.url, name: child.name, parent_id: item.id, children: children }
        end
      end

      all
    end
  end
end

