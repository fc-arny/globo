// jQuery -------------------------
//---------------------------------
//= require jquery/dist/jquery
//= require jquery_ujs

//= require jquery-maskedinput/dist/jquery.maskedinput
//= require jquery-cycle2/build/jquery.cycle2
//= require jquery-ui/ui/jquery-ui
//= require jquery-mousewheel/jquery.mousewheel
//= require jquery.scrollTo/jquery.scrollTo
//= require jquery.jscrollpane/jquery.jscrollpane

// Bootstrap ----------------------
//---------------------------------
//= require bootstrap/dist/js/bootstrap

// Underscore ---------------------
//---------------------------------
//= require underscore/underscore

// Common -------------------------
//---------------------------------
//= require_tree ./core
//= require common/init
//= require_tree ./common/classes

// Plugins ------------------------
//---------------------------------
//= require common/plugins/ajaxForm
//= require common/plugins/ajaxPopup
//= require common/plugins/flashMessage
//= require common/plugins/userState
//= require common/plugins/resetPhone


$(document).ready(function() {


    // DEEP REFACTORING
	// Init
	var overlay = $('.overlay');
	var body = $('body');
	var page = $('.page');
	var wrap = $('.wrap');
	var header = $('.header');
//	var $fWelcome = $('.popup_welcome');

//	var btn_shop = $('.js-shops');
//	btn_shop.click(function() {
//		$(this).toggleClass('is-open');
//	});
//	btn_shop.find('li').click(function() {
//		var pic = $(this).find('img').attr('src');
//		$(this).parent().parent().next().find('img').attr('src', pic);
//	});
//	btn_shop.click(function(event) {
//		event.stopPropagation();
//	});

//	var cart_el =  $('.cart');
//	var cart_popup = $('.cart__popup');
//	var cart_close = $('.js-cart-close');
//	var cart_popup_open = $('.js-cart-popup > li');
//	var cart_arr = $('.cart__arr');
//	var scroll_el = $('.js-scroll');
//	var popup_el = $('.popup');
//	var popup_close = $('.popup__btn-close');
//	var datepicker_el = $('.datepicker__wrap');
//
////	popup_close.click(function() {
////		popup_el.hide();
////		overlay.hide();
////	});
//
//	cart_popup_open.click(function() {
//		var pos_top = $(this).position().top;
//		var height = $(this).height();
//		var top = pos_top + height/2 - 14;
//		cart_arr.css('top', top);
//		if (!cart_el.hasClass('is-open')) {
//			cart_el.addClass('is-open');
//			cart_popup.show();
//			scroll_init();
//			page_top = scroll_top;
//			page.css('top', -page_top);
//			body.addClass('no-scroll');
//			overlay.show();
//		};
//	});
//
//	cart_close.click(function() {
//		var wnd_width = $(window).width();
//		cart_popup.hide();
//		overlay.hide();
//		body.removeClass('no-scroll');
//		cart_el.removeClass('is-open');
//		cart_el.addClass('is-move');
//	});

//	overlay.click(function() {
//		$(this).hide();
//		cart_popup.hide();
//		prod.hide();
//		popup_el.hide();
//		cart_el.removeClass('is-open');
//		body.removeClass('no-scroll');
//	});

//product popup
	var prod = $('.prod');
	var prod_open = $('.js-prod-open');
	var prod_close = $('.js-prod-close');
	prod_open.click(function() {
		var prod_height = prod.height();
		body.css({'min-height': prod_height});
		prod.show();
	});
	prod_close.click(function() {
		prod.hide();
		body.removeClass('no-scroll');
	});

//buy prod (add prod in cart)
//	var add_prod = $('.js-add-prod');
//	var del_prod = $('.js-del-prod')
//	add_prod.click(function() {
//		$(this).parent().parent().animate({left: 0}, 200);
//		$(this).parent().parent().parent().parent().addClass('is-selected');
//	});
//	del_prod.click(function() {
//		$(this).parent().parent().parent().animate({left: '-100%'}, 200);
//		$(this).parent().parent().parent().parent().parent().removeClass('is-selected');
//	});

//page
	var page_fixed = $('.js-prod-open');
	var page_no_fixed = $('.js-prod-close, .js-cart-close, .overlay');
	var page_top = 0;

//	page_fixed.click(function() {
//		page_top = scroll_top;
//		page.css('top', -page_top);
//		body.addClass('no-scroll');
//		overlay.show();
//	});

//	page_no_fixed.click(function() {
//		overlay.hide();
//		$(window).scrollTo(page_top + 'px', 0);
//		body.removeAttr('style');
//	});

//order accordeon
	var order_accord = $('.js-accord-order');
	order_accord.click(function() {
		$(this).next().slideToggle();
	});

//purchases
	var purchases = $('.js-purchases');
	purchases.click(function() {
		$(this).next().slideToggle();
	});

//scroll init
//	function scroll_init() {
//		scroll_el.jScrollPane( {
//			hideFocus: true
//			//autoReinitialise: true
//			//autoReinitialiseDelay: 500
//		});
//	};

//shop-search
	function search_shop() {
		var el = $('.js-shop-search');
		var btn = el.find('span');
		btn.click(function() {
			$(this).next().show();
		});
		el.find('li').click(function() {
			var val = $(this).find('img').attr('src');
			$(this).parent().prev().find('img').attr('src', val);
			$(this).parent().hide();
		});
		btn.click(function(event){
			event.stopPropagation();
		});
	};

//account
	function account() {
		var el = $('.account__nav');
		var item = $('.account__content');
		item.hide();
		item.first().show();
		el.find('button').click(function() {
			if (!$(this).hasClass('is-active')) {
				item.slideUp();
				el.find('button').removeClass('is-active');
				var val = $(this).attr('data-tab');
				$(this).addClass('is-active');
				$('.' + val).slideDown();
			};
		});
	};



//menu - sub
	function submenu() {
		var el = $('.menu');
		var el_sub = $('.menu__sub');
		var item = el.find('.menu__list-in > li');
		var arr = el.find('.menu__sub-arr');
		item.hover(
			function () {
				var item_sub = $(this).attr('data-item');
				var item_cur = $('#' + item_sub);
				var width = $(this).width();
				var width_parent = el.width();
				var width_sub = item_cur.width();
				var pos_left = $(this).position().left;
				var arr_left = pos_left + width/2 - 7;
				arr.css('left', arr_left);
				arr.show();
				item_cur.hover(
					function() {
						$(this).show();
						arr.show();
					},
					function() {
						$(this).hide();
						arr.hide();
					}
				);
				if (width_parent - width_sub > pos_left) {
					item_cur.css({'left': pos_left, 'right': 'auto'}).show();
				}
				else {
					item_cur.css({'left': 'auto', 'right': '-30px'}).show();
				}
			},
			function() {
				arr.hide();
				el_sub.hide();
			}
		);
	};

//choice_date
	function choice_date() {
		var el = $('.js-datepicker');
		var wrap = el.find('.datepicker__wrap');
		if (wrap.length > 0) {
			wrap.datepicker({
				inline: true,
				monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь',
					'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
				monthNamesShort: ['января','февраля','марта','апреля','мая','июня',
					'июля','августа','сентября','октября','ноября','декабря'],
				dayNames: ['воскресенье','понедельник','вторник','среда','четверг','пятница','суббота'],
				dayNamesShort: ['вск','пнд','втр','срд','чтв','птн','сбт'],
				dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
				minDate: "0",
				dateFormat: "dd M",
				showOtherMonths: true,
				firstDay: 1,
				onSelect: function(date) {
					$(this).prev().html(date);
					$(this).hide();
				}
			});
			el.click(function() {
				$(this).find('.datepicker__wrap').show();
			});
			el.click(function(event){
				event.stopPropagation();
			});
		};
	};

//menu - slider
	function slidermenu_responsive() {
		var el = $('.menu');
		var prev = el.find('.menu__btn-prev');
		var next = el.find('.menu__btn-next');
		var items = el.find('.menu__list-in li');
		var width_parent = el.width();
		var width_list = 0;
		items.each(function() {
			width_list += $(this).width();
			return(width_list);
		});
		if (width_parent < width_list) {
			el.addClass('is-slider');
			next.show();
		}
		else {
			el.removeClass('is-slider');
			next.hide();
			prev.hide();
		}
	};
	function slidermenu() {
		var el = $('.menu');
		var el_scroll = el.find('.menu__list');
		var prev = el.find('.menu__btn-prev');
		var next = el.find('.menu__btn-next');
		var items = el.find('.menu__list-in li');
		el.find('.menu__list-in li:first').addClass('is-current');
		var width_parent = el.width();
		var width_list = 0;
		items.each(function() {
			width_list += $(this).width();
			return(width_list);
		});
		next.click(function() {
			prev.show();
			var width_parent = el.width();
			el_scroll.scrollTo('+=200px', 400, {
				onAfter: function() {
					var pos_left = el.find('.menu__list-in').position().left;
					if (pos_left == width_parent - width_list) {
						next.hide();
					};
				}
			});
		});
		prev.click(function() {
			next.show();
			el_scroll.scrollTo('-=200px', 400, {
				onAfter: function() {
					var pos_left = el.find('.menu__list-in').position().left;
					if (pos_left == 0) {
						prev.hide();
					};
				}
			});
		});
	};

//weight
//	function weight() {
//		var el = $('.js-weight');
//		var plus = el.find('.weight__btn-plus');
//		var minus = el.find('.weight__btn-minus');
//		plus.click(function() {
//			var val = $(this).parent().find('.weight__val input').val();
//			var factor = el.parent().find('.weight__val input').attr('data-factor');
//			var sum = parseInt(val) + parseInt(factor);
//			$(this).parent().find('.weight__val input').val(sum);
//		});
//		minus.click(function() {
//			var val = $(this).parent().find('.weight__val input').val();
//			var factor = el.parent().find('.weight__val input').attr('data-factor');
//			var res = parseInt(val) - parseInt(factor);
//			if (res > 0) {
//				$(this).parent().find('.weight__val input').val(res);
//			};
//		});
//	};

//tabs
	function tabs() {
		var el = $('.js-tabs');
		var nav_item = el.find('.tabs__nav button');
		el.find('.tabs__content:not(:first)').hide();
		nav_item.click(function() {
			if (!$(this).hasClass('is-active')) {
				var val = $(this).attr('data-tab');
				el.find('.tabs__content').slideUp();
				nav_item.removeClass('is-active');
				$(this).addClass('is-active');
				$('.' + val).slideDown();
			};
		});
	};

//main slider
	function m_slider() {
		var el = $('.js-m-slider');
		var items = el.find('.m-slider__item').length;
		var pager = el.find('.m-slider__pager');
		if (items <= 1) {
			pager.hide();
		};
	}

//select
	function select() {
		var el = $('.js-select');
		var el_title = el.find('span');
		var item = el.find('li');
		var list = el.find('ul');
		el_title.click(function() {
			if ($(this).parent().hasClass('is-open')) {
				$(this).parent().removeClass('is-open');
			}
			else {
				el.removeClass('is-open');
				$(this).parent().addClass('is-open');
			};
		});
		item.click(function() {
			var val = $(this).text();
			$(this).parent().prev().addClass('is-selected');
			$(this).parent().prev().html(val + '<i></i>');
			el.removeClass('is-open');
		});
		el_title.click(function(event){
			event.stopPropagation();
		});
	};

	function accordion() {
		var el = $('.accordion');
		var items = $('.accordion__item');
		var desc = el.find('.accordion__content');
		var btn = el.find('.accordion__top button');
		btn.click(function() {
			if (!$(this).parent().parent().hasClass('is-active')) {
				desc.slideUp(200);
				items.removeClass('is-active');
				$(this).parent().parent().addClass('is-active');
				$(this).parent().next().slideDown(200);
			};
		});
	};

//address
	function address() {
		var template = $('.js-address-template').html();
		var list = $('.js-address-list');
		var btn_add = $('.js-address-add');
		btn_add.click(function() {
			list.append(template);
		});
		$(document).on('click', '.js-address-del', function() {
			$(this).parent().parent().remove();
		});
	};

//init
	submenu();
	slidermenu();
	slidermenu_responsive();
//	weight();
	tabs();
	m_slider();
	select();
	choice_date();
//	payment();
//	steps();
	account();
	search_shop();
//	scroll_init();
	accordion(); //TODO: Create plugin or use thirdpart
	address();

//window resize
	$(window).resize(function() {
		//init
//		slidermenu_responsive();
//		$(window).scrollTo(page_top + 'px', 0);
//		body.removeAttr('style');
//		scroll_init();
	});

//window scroll


//click document
	$(document).click(function() {
//		btn_login.next().hide();
//		btn_shop.removeClass('is-open');
//		btn_sort.next().hide();
//		datepicker_el.hide();
		$('.js-select').removeClass('is-open');
		$('.js-shop-search').find('ul').hide();
	});

//escape click
	$(document).keyup(function(e) {
		if (e.keyCode == 27) {
//			overlay.hide();
//			prod.hide();
//			cart_el.removeClass('is-open');
////			body.removeClass('no-scroll');
////			$(window).scrollTo(page_top + 'px', 0);
//			body.removeAttr('style');
//			cart_popup.hide();
//			popup_el.hide();
//			datepicker_el.hide();
		}
	});

});
