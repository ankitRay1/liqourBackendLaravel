<?php

use Illuminate\Support\Facades\Route;


Route::group(['namespace' => 'Admin', 'as' => 'admin.'], function () {
    /*authentication*/
    Route::group(['namespace' => 'Auth', 'prefix' => 'auth', 'as' => 'auth.'], function () {
        Route::get('login', 'LoginController@login')->name('login');
        Route::post('login', 'LoginController@submit');
        Route::get('logout', 'LoginController@logout')->name('logout');
    });
    /*authentication*/

    Route::group(['middleware' => ['admin']], function () {

        Route::get('settings', 'SystemController@settings')->name('settings');
        Route::post('settings', 'SystemController@settings_update');
        Route::post('settings-password', 'SystemController@settings_password_update')->name('settings-password');
        Route::get('/get-store-data', 'SystemController@store_data')->name('get-store-data');

        //dashboard
        Route::get('/', 'DashboardController@dashboard')->name('dashboard');

        Route::resource('account-transaction', 'AccountTransactionController')->middleware('module:account');

        Route::resource('provide-deliveryman-earnings', 'ProvideDMEarningController')->middleware('module:provide_dm_earning');

        Route::get('maintenance-mode', 'SystemController@maintenance_mode')->name('maintenance-mode');

        Route::get('module/status/{id}/{status}', 'ModuleController@status')->middleware('module:module')->name('module.status');
        Route::get('module/type', 'ModuleController@type')->middleware('module:module')->name('module.type');
        Route::resource('module', 'ModuleController')->middleware('module:module');

        Route::resource('unit', 'UnitController')->middleware('module:unit');

        Route::group(['prefix'=>'parcel','as'=>'parcel.','middleware'=>['module:parcel']], function(){
            Route::get('category/status/{id}/{status}', 'ParcelCategoryController@status')->name('category.status');
            Route::resource('category', 'ParcelCategoryController');
            Route::get('orders', 'ParcelController@orders')->name('orders');
            Route::get('details/{id}', 'ParcelController@order_details')->name('order.details');
            Route::get('settings', 'ParcelController@settings')->name('settings');
            Route::post('settings', 'ParcelController@update_settings')->name('update.settings');
        });

        Route::group(['prefix' => 'dashboard-stats', 'as' => 'dashboard-stats.'], function () {
            Route::post('order', 'DashboardController@order')->name('order');
            Route::post('zone', 'DashboardController@zone')->name('zone');
            Route::post('user-overview', 'DashboardController@user_overview')->name('user-overview');
            Route::post('business-overview', 'DashboardController@business_overview')->name('business-overview');
        });

        Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
            Route::get('create', 'CustomRoleController@create')->name('create');
            Route::post('create', 'CustomRoleController@store');
            Route::get('edit/{id}', 'CustomRoleController@edit')->name('edit');
            Route::post('update/{id}', 'CustomRoleController@update')->name('update');
            Route::delete('delete/{id}', 'CustomRoleController@distroy')->name('delete');
            Route::post('search', 'CustomRoleController@search')->name('search');
        });

        Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
            Route::get('add-new', 'EmployeeController@add_new')->name('add-new');
            Route::post('add-new', 'EmployeeController@store');
            Route::get('list', 'EmployeeController@list')->name('list');
            Route::get('update/{id}', 'EmployeeController@edit')->name('edit');
            Route::post('update/{id}', 'EmployeeController@update')->name('update');
            Route::delete('delete/{id}', 'EmployeeController@distroy')->name('delete');
            Route::post('search', 'EmployeeController@search')->name('search');
        });
        Route::post('item/variant-price', 'ItemController@variant_price')->name('item.variant-price');
        Route::group(['prefix' => 'item', 'as' => 'item.', 'middleware' => ['module:item']], function () {
            Route::get('add-new', 'ItemController@index')->name('add-new');
            Route::post('variant-combination', 'ItemController@variant_combination')->name('variant-combination');
            Route::post('store', 'ItemController@store')->name('store');
            Route::get('edit/{id}', 'ItemController@edit')->name('edit');
            Route::post('update/{id}', 'ItemController@update')->name('update');
            Route::get('list', 'ItemController@list')->name('list');
            Route::delete('delete/{id}', 'ItemController@delete')->name('delete');
            Route::get('status/{id}/{status}', 'ItemController@status')->name('status');
            Route::get('review-status/{id}/{status}', 'ItemController@reviews_status')->name('reviews.status');
            Route::post('search', 'ItemController@search')->name('search');
            Route::get('reviews', 'ItemController@review_list')->name('reviews');
            Route::get('remove-image', 'ItemController@remove_image')->name('remove-image');
            Route::get('view/{id}', 'ItemController@view')->name('view');
            //ajax request
            Route::get('get-categories', 'ItemController@get_categories')->name('get-categories');
            Route::get('get-items', 'ItemController@get_items')->name('getitems');

            //Import and export
            Route::get('bulk-import', 'ItemController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'ItemController@bulk_import_data');
            Route::get('bulk-export', 'ItemController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'ItemController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'banner', 'as' => 'banner.', 'middleware' => ['module:banner']], function () {
            Route::get('add-new', 'BannerController@index')->name('add-new');
            Route::post('store', 'BannerController@store')->name('store');
            Route::get('edit/{banner}', 'BannerController@edit')->name('edit');
            Route::post('update/{banner}', 'BannerController@update')->name('update');
            Route::get('status/{id}/{status}', 'BannerController@status')->name('status');
            Route::get('featured/{id}/{status}', 'BannerController@featured')->name('featured');
            Route::delete('delete/{banner}', 'BannerController@delete')->name('delete');
            Route::post('search', 'BannerController@search')->name('search');
        });

        Route::group(['prefix' => 'campaign', 'as' => 'campaign.', 'middleware' => ['module:campaign']], function () {
            Route::get('{type}/add-new', 'CampaignController@index')->name('add-new');
            Route::post('store/basic', 'CampaignController@storeBasic')->name('store-basic');
            Route::post('store/item', 'CampaignController@storeItem')->name('store-item');
            Route::get('{type}/edit/{campaign}', 'CampaignController@edit')->name('edit');
            Route::get('{type}/view/{campaign}', 'CampaignController@view')->name('view');
            Route::post('basic/update/{campaign}', 'CampaignController@update')->name('update-basic');
            Route::post('item/update/{campaign}', 'CampaignController@updateItem')->name('update-item');
            Route::get('remove-store/{campaign}/{store}', 'CampaignController@remove_store')->name('remove-store');
            Route::post('add-store/{campaign}', 'CampaignController@addstore')->name('addstore');
            Route::get('{type}/list', 'CampaignController@list')->name('list');
            Route::get('status/{type}/{id}/{status}', 'CampaignController@status')->name('status');
            Route::delete('delete/{campaign}', 'CampaignController@delete')->name('delete');
            Route::delete('item/delete/{campaign}', 'CampaignController@delete_item')->name('delete-item');
            Route::post('basic-search', 'CampaignController@searchBasic')->name('searchBasic');
            Route::post('item-search', 'CampaignController@searchItem')->name('searchItem');
        });

        Route::group(['prefix' => 'coupon', 'as' => 'coupon.', 'middleware' => ['module:coupon']], function () {
            Route::get('add-new', 'CouponController@add_new')->name('add-new');
            Route::post('store', 'CouponController@store')->name('store');
            Route::get('update/{id}', 'CouponController@edit')->name('update');
            Route::post('update/{id}', 'CouponController@update');
            Route::get('status/{id}/{status}', 'CouponController@status')->name('status');
            Route::delete('delete/{id}', 'CouponController@delete')->name('delete');
            Route::post('search', 'CouponController@search')->name('search');
        });

        Route::group(['prefix' => 'attribute', 'as' => 'attribute.', 'middleware' => ['module:attribute']], function () {
            Route::get('add-new', 'AttributeController@index')->name('add-new');
            Route::post('store', 'AttributeController@store')->name('store');
            Route::get('edit/{id}', 'AttributeController@edit')->name('edit');
            Route::post('update/{id}', 'AttributeController@update')->name('update');
            Route::delete('delete/{id}', 'AttributeController@delete')->name('delete');
            Route::post('search', 'AttributeController@search')->name('search');

            //Import and export
            Route::get('bulk-import', 'AttributeController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'AttributeController@bulk_import_data');
            Route::get('bulk-export', 'AttributeController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'AttributeController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'vendor', 'as' => 'vendor.'], function () {
                Route::get('get-stores-data/{store}', 'VendorController@get_store_data')->name('get-stores-data');
                Route::get('store-filter/{id}', 'VendorController@store_filter')->name('storefilter');
                Route::get('get-account-data/{store}', 'VendorController@get_account_data')->name('storefilter');
                Route::get('get-stores', 'VendorController@get_stores')->name('get-stores');
                Route::get('get-addons', 'VendorController@get_addons')->name('get_addons');
            Route::group(['middleware' => ['module:store']], function () {
                Route::get('update-application/{id}/{status}', 'VendorController@update_application')->name('application');
                Route::get('add', 'VendorController@index')->name('add');
                Route::post('store', 'VendorController@store')->name('store');
                Route::get('edit/{id}', 'VendorController@edit')->name('edit');
                Route::post('update/{store}', 'VendorController@update')->name('update');
                Route::post('discount/{store}', 'VendorController@discountSetup')->name('discount');
                Route::post('update-settings/{store}', 'VendorController@updateStoreSettings')->name('update-settings');
                Route::delete('delete/{store}', 'VendorController@destroy')->name('delete');
                Route::delete('clear-discount/{store}', 'VendorController@cleardiscount')->name('clear-discount');
                // Route::get('view/{store}', 'VendorController@view')->name('view_tab');
                Route::get('view/{store}/{tab?}/{sub_tab?}', 'VendorController@view')->name('view');
                Route::get('list', 'VendorController@list')->name('list');
                Route::post('search', 'VendorController@search')->name('search');
                Route::get('status/{store}/{status}', 'VendorController@status')->name('status');
                Route::get('featured/{store}/{status}', 'VendorController@featured')->name('featured');
                Route::get('toggle-settings-status/{store}/{status}/{menu}', 'VendorController@store_status')->name('toggle-settings');
                Route::post('status-filter', 'VendorController@status_filter')->name('status-filter');
                
                //Import and export
                Route::get('bulk-import', 'VendorController@bulk_import_index')->name('bulk-import');
                Route::post('bulk-import', 'VendorController@bulk_import_data');
                Route::get('bulk-export', 'VendorController@bulk_export_index')->name('bulk-export-index');
                Route::post('bulk-export', 'VendorController@bulk_export_data')->name('bulk-export');
                //Store shcedule
                Route::post('add-schedule', 'VendorController@add_schedule')->name('add-schedule');
                Route::get('remove-schedule/{store_schedule}', 'VendorController@remove_schedule')->name('remove-schedule');
            });

            Route::group(['middleware' => ['module:withdraw_list']], function () {
                Route::post('withdraw-status/{id}', 'VendorController@withdrawStatus')->name('withdraw_status');
                Route::get('withdraw_list', 'VendorController@withdraw')->name('withdraw_list');
                Route::get('withdraw-view/{withdraw_id}/{seller_id}', 'VendorController@withdraw_view')->name('withdraw_view');
            });

        });

        Route::group(['prefix' => 'addon', 'as' => 'addon.', 'middleware' => ['module:addon']], function () {
            Route::get('add-new', 'AddOnController@index')->name('add-new');
            Route::post('store', 'AddOnController@store')->name('store');
            Route::get('edit/{id}', 'AddOnController@edit')->name('edit');
            Route::post('update/{id}', 'AddOnController@update')->name('update');
            Route::delete('delete/{id}', 'AddOnController@delete')->name('delete');
            Route::get('status/{addon}/{status}', 'AddOnController@status')->name('status');
            Route::post('search', 'AddOnController@search')->name('search');
            //Import and export
            Route::get('bulk-import', 'AddOnController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'AddOnController@bulk_import_data');
            Route::get('bulk-export', 'AddOnController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'AddOnController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'category', 'as' => 'category.'], function () {
            Route::get('get-all', 'CategoryController@get_all')->name('get-all');
            Route::group(['middleware' => ['module:category']], function () {
                Route::get('add', 'CategoryController@index')->name('add');
                Route::get('add-sub-category', 'CategoryController@sub_index')->name('add-sub-category');
                Route::get('add-sub-sub-category', 'CategoryController@sub_sub_index')->name('add-sub-sub-category');
                Route::post('store', 'CategoryController@store')->name('store');
                Route::get('edit/{id}', 'CategoryController@edit')->name('edit');
                Route::post('update/{id}', 'CategoryController@update')->name('update');
                Route::get('update-priority/{category}', 'CategoryController@update_priority')->name('priority');
                Route::post('store', 'CategoryController@store')->name('store');
                Route::get('status/{id}/{status}', 'CategoryController@status')->name('status');
                Route::delete('delete/{id}', 'CategoryController@delete')->name('delete');
                Route::post('search', 'CategoryController@search')->name('search');

                //Import and export
                Route::get('bulk-import', 'CategoryController@bulk_import_index')->name('bulk-import');
                Route::post('bulk-import', 'CategoryController@bulk_import_data');
                Route::get('bulk-export', 'CategoryController@bulk_export_index')->name('bulk-export-index');
                Route::post('bulk-export', 'CategoryController@bulk_export_data')->name('bulk-export');
            });
        });
        Route::get('order/generate-invoice/{id}', 'OrderController@generate_invoice')->name('order.generate-invoice');
        Route::get('order/status', 'OrderController@status')->name('order.status');
        Route::group(['prefix' => 'order', 'as' => 'order.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', 'OrderController@list')->name('list');
            Route::get('details/{id}', 'OrderController@details')->name('details');
            
            // Route::put('status-update/{id}', 'OrderController@status')->name('status-update');
            Route::get('view/{id}', 'OrderController@view')->name('view');
            Route::post('update-shipping/{order}', 'OrderController@update_shipping')->name('update-shipping');
            Route::delete('delete/{id}', 'OrderController@delete')->name('delete');

            Route::get('add-delivery-man/{order_id}/{delivery_man_id}', 'OrderController@add_delivery_man')->name('add-delivery-man');
            Route::get('payment-status', 'OrderController@payment_status')->name('payment-status');
            
            Route::post('add-payment-ref-code/{id}', 'OrderController@add_payment_ref_code')->name('add-payment-ref-code');
            Route::get('store-filter/{store_id}', 'OrderController@restaurnt_filter')->name('store-filter');
            Route::get('filter/reset', 'OrderController@filter_reset');
            Route::post('filter', 'OrderController@filter')->name('filter');
            Route::get('search', 'OrderController@search')->name('search');
            //order update
            Route::post('add-to-cart', 'OrderController@add_to_cart')->name('add-to-cart');
            Route::post('remove-from-cart', 'OrderController@remove_from_cart')->name('remove-from-cart');
            Route::get('update/{order}', 'OrderController@update')->name('update');
            Route::get('edit-order/{order}', 'OrderController@edit')->name('edit');
            Route::get('quick-view', 'OrderController@quick_view')->name('quick-view');
            Route::get('quick-view-cart-item', 'OrderController@quick_view_cart_item')->name('quick-view-cart-item');
            Route::get('export-orders/{file_type}/{status}/{type}','OrderController@export_orders')->name('export');
        });

        Route::group(['prefix' => 'dispatch', 'as' => 'dispatch.', 'middleware' => ['module:order']],function(){
            Route::get('list/{status}', 'OrderController@dispatch_list')->name('list');
        });

        Route::group(['prefix' => 'zone', 'as' => 'zone.', 'middleware' => ['module:zone']], function () {
            Route::get('/', 'ZoneController@index')->name('home');
            Route::post('store', 'ZoneController@store')->name('store');
            Route::get('edit/{id}', 'ZoneController@edit')->name('edit');
            Route::post('update/{id}', 'ZoneController@update')->name('update');
            Route::delete('delete/{zone}', 'ZoneController@destroy')->name('delete');
            Route::get('status/{id}/{status}', 'ZoneController@status')->name('status');
            Route::post('search', 'ZoneController@search')->name('search');
            Route::get('zone-filter/{id}', 'ZoneController@zone_filter')->name('zonefilter');
            Route::get('get-all-zone-cordinates/{id?}', 'ZoneController@get_all_zone_cordinates')->name('zoneCoordinates');
        });

        Route::group(['prefix' => 'notification', 'as' => 'notification.', 'middleware' => ['module:notification']], function () {
            Route::get('add-new', 'NotificationController@index')->name('add-new');
            Route::post('store', 'NotificationController@store')->name('store');
            Route::get('edit/{id}', 'NotificationController@edit')->name('edit');
            Route::post('update/{id}', 'NotificationController@update')->name('update');
            Route::get('status/{id}/{status}', 'NotificationController@status')->name('status');
            Route::delete('delete/{id}', 'NotificationController@delete')->name('delete');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.', 'middleware' => ['module:settings']], function () {
            Route::get('business-setup', 'BusinessSettingsController@business_index')->name('business-setup');
            Route::get('config-setup', 'BusinessSettingsController@config_setup')->name('config-setup');
            Route::post('config-update', 'BusinessSettingsController@config_update')->name('config-update');
            Route::post('update-setup', 'BusinessSettingsController@business_setup')->name('update-setup');
            Route::get('app-settings', 'BusinessSettingsController@app_settings')->name('app-settings');
            Route::POST('app-settings', 'BusinessSettingsController@update_app_settings')->name('app-settings');
            Route::get('landing-page-settings/{tab?}', 'BusinessSettingsController@landing_page_settings')->name('landing-page-settings');
            Route::POST('landing-page-settings/{tab}', 'BusinessSettingsController@update_landing_page_settings')->name('landing-page-settings');
            Route::DELETE('landing-page-settings/{tab}/{key}', 'BusinessSettingsController@delete_landing_page_settings')->name('landing-page-settings-delete');

            Route::get('toggle-settings/{key}/{value}', 'BusinessSettingsController@toggle_settings')->name('toggle-settings');

            Route::get('fcm-index', 'BusinessSettingsController@fcm_index')->name('fcm-index');
            Route::post('update-fcm', 'BusinessSettingsController@update_fcm')->name('update-fcm');

            Route::post('update-fcm-messages', 'BusinessSettingsController@update_fcm_messages')->name('update-fcm-messages');

            Route::get('mail-config', 'BusinessSettingsController@mail_index')->name('mail-config');
            Route::post('mail-config', 'BusinessSettingsController@mail_config');
            Route::get('send-mail', 'BusinessSettingsController@send_mail')->name('mail.send');

            Route::get('payment-method', 'BusinessSettingsController@payment_index')->name('payment-method');
            Route::post('payment-method-update/{payment_method}', 'BusinessSettingsController@payment_update')->name('payment-method-update');

            Route::get('currency-add', 'BusinessSettingsController@currency_index')->name('currency-add');
            Route::post('currency-add', 'BusinessSettingsController@currency_store');
            Route::get('currency-update/{id}', 'BusinessSettingsController@currency_edit')->name('currency-update');
            Route::put('currency-update/{id}', 'BusinessSettingsController@currency_update');
            Route::delete('currency-delete/{id}', 'BusinessSettingsController@currency_delete')->name('currency-delete');

            Route::get('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions')->name('terms-and-conditions');
            Route::post('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions_update');

            Route::get('pages/privacy-policy', 'BusinessSettingsController@privacy_policy')->name('privacy-policy');
            Route::post('pages/privacy-policy', 'BusinessSettingsController@privacy_policy_update');

            Route::get('pages/about-us', 'BusinessSettingsController@about_us')->name('about-us');
            Route::post('pages/about-us', 'BusinessSettingsController@about_us_update');
            // Social media
            Route::get('social-media/fetch','SocialMediaController@fetch')->name('social-media.fetch');
            Route::get('social-media/status-update','SocialMediaController@social_media_status_update')->name('social-media.status-update');
            Route::resource('social-media','SocialMediaController');

            Route::get('sms-module', 'SMSModuleController@sms_index')->name('sms-module');
            Route::post('sms-module-update/{sms_module}', 'SMSModuleController@sms_update')->name('sms-module-update');

            //recaptcha
            Route::get('recaptcha', 'BusinessSettingsController@recaptcha_index')->name('recaptcha_index');
            Route::post('recaptcha-update', 'BusinessSettingsController@recaptcha_update')->name('recaptcha_update');

            //db clean
            Route::get('db-index', 'DatabaseSettingController@db_index')->name('db-index');
            Route::post('db-clean', 'DatabaseSettingController@clean_db')->name('clean-db');
        });

        Route::group(['prefix' => 'message', 'as' => 'message.'], function () {
            Route::get('list', 'ConversationController@list')->name('list');
            Route::post('store/{user_id}', 'ConversationController@store')->name('store');
            Route::get('view/{user_id}', 'ConversationController@view')->name('view');
        });

        Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.'], function () {
            Route::get('get-account-data/{deliveryman}', 'DeliveryManController@get_account_data')->name('storefilter');
            Route::group(['middleware' => ['module:deliveryman']], function () {
                Route::get('add', 'DeliveryManController@index')->name('add');
                Route::post('store', 'DeliveryManController@store')->name('store');
                Route::get('list', 'DeliveryManController@list')->name('list');
                Route::get('preview/{id}/{tab?}', 'DeliveryManController@preview')->name('preview');
                Route::get('status/{id}/{status}', 'DeliveryManController@status')->name('status');
                Route::get('earning/{id}/{status}', 'DeliveryManController@earning')->name('earning');
                Route::get('update-application/{id}/{status}', 'DeliveryManController@update_application')->name('application');
                Route::get('edit/{id}', 'DeliveryManController@edit')->name('edit');
                Route::post('update/{id}', 'DeliveryManController@update')->name('update');
                Route::delete('delete/{id}', 'DeliveryManController@delete')->name('delete');
                Route::post('search', 'DeliveryManController@search')->name('search');
                Route::get('get-deliverymen', 'DeliveryManController@get_deliverymen')->name('get-deliverymen');

                Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
                    Route::get('list', 'DeliveryManController@reviews_list')->name('list');
                    Route::get('status/{id}/{status}', 'DeliveryManController@reviews_status')->name('status');
                });
            });
        });
        // Subscribed customer Routes
        Route::group(['prefix' => 'customer', 'as' => 'customer.'], function () {
            Route::get('subscribed', 'CustomerController@subscribedCustomers')->name('subscribed');
            Route::post('subscriber-search', 'CustomerController@subscriberMailSearch')->name('subscriberMailSearch');

        });
        //Pos system
        Route::group(['prefix' => 'pos', 'as' => 'pos.'], function () {
            Route::post('variant_price', 'POSController@variant_price')->name('variant_price');
            Route::group(['middleware' => ['module:pos']], function () {
                Route::get('/', 'POSController@index')->name('index');
                Route::get('quick-view', 'POSController@quick_view')->name('quick-view');
                Route::get('quick-view-cart-item', 'POSController@quick_view_card_item')->name('quick-view-cart-item');
                Route::post('add-to-cart', 'POSController@addToCart')->name('add-to-cart');
                Route::post('remove-from-cart', 'POSController@removeFromCart')->name('remove-from-cart');
                Route::post('cart-items', 'POSController@cart_items')->name('cart_items');
                Route::post('update-quantity', 'POSController@updateQuantity')->name('updateQuantity');
                Route::post('empty-cart', 'POSController@emptyCart')->name('emptyCart');
                Route::post('tax', 'POSController@update_tax')->name('tax');
                Route::post('discount', 'POSController@update_discount')->name('discount');
                Route::get('customers', 'POSController@get_customers')->name('customers');
                Route::post('order', 'POSController@place_order')->name('order');
                Route::get('orders', 'POSController@order_list')->name('orders');
                Route::post('search', 'POSController@search')->name('search');
                Route::get('order-details/{id}', 'POSController@order_details')->name('order-details');
                Route::get('invoice/{id}', 'POSController@generate_invoice');
                Route::post('customer-store', 'POSController@customer_store')->name('customer-store');
            });
        });

        Route::group(['prefix' => 'reviews', 'as' => 'reviews.', 'middleware' => ['module:customerList']], function () {
            Route::get('list', 'ReviewsController@list')->name('list');
            Route::post('search', 'ReviewsController@search')->name('search');
        });

        Route::group(['prefix' => 'report', 'as' => 'report.', 'middleware' => ['module:report']], function () {
            Route::get('order', 'ReportController@order_index')->name('order');
            Route::get('day-wise-report', 'ReportController@day_wise_report')->name('day-wise-report');
            Route::get('item-wise-report', 'ReportController@item_wise_report')->name('item-wise-report');
            Route::post('item-wise-report-search', 'ReportController@item_search')->name('item-wise-report-search');
            Route::get('order-transactions', 'ReportController@order_transaction')->name('order-transaction');
            Route::get('earning', 'ReportController@earning_index')->name('earning');
            Route::post('set-date', 'ReportController@set_date')->name('set-date');
            Route::get('stock-report', 'ReportController@stock_report')->name('stock-report');
        });

        Route::group(['prefix' => 'customer', 'as' => 'customer.', 'middleware' => ['module:customerList']], function () {
            Route::get('list', 'CustomerController@customer_list')->name('list');
            Route::get('view/{user_id}', 'CustomerController@view')->name('view');
            Route::post('search', 'CustomerController@search')->name('search');
            Route::get('status/{customer}/{status}', 'CustomerController@status')->name('status');
        });


        Route::group(['prefix' => 'file-manager', 'as' => 'file-manager.'], function () {
            Route::get('/download/{file_name}', 'FileManagerController@download')->name('download');
            Route::get('/index/{folder_path?}', 'FileManagerController@index')->name('index');
            Route::post('/image-upload', 'FileManagerController@upload')->name('image-upload');
            Route::delete('/delete/{file_path}', 'FileManagerController@destroy')->name('destroy');
        });

        //social media login
        // Route::group(['prefix' => 'social-login', 'as' => 'social-login.','middleware'=>['module:business_settings']], function () {
        //     Route::get('view', 'BusinessSettingsController@viewSocialLogin')->name('view');
        //     Route::post('update/{service}', 'BusinessSettingsController@updateSocialLogin')->name('update');

        // });
    });

    Route::get('zone/get-coordinates/{id}', 'ZoneController@get_coordinates')->name('zone.get-coordinates');
});
