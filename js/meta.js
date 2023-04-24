$(function() {
	if(typeof fbq=='function'){
	    $(document).on("rabbitCms.AddToCart", function(e, cartData){
	    	if(debugNer==true)console.log('META: Sepete Eklendi!', cartData);
	    	fbq('track', 'AddToCart');
	    }).on("rabbitCms.RemoveFromCart", function(e, cartData){
	    	if(debugNer==true) console.log('META: Sepetten Çıkartıldı!', cartData);

	    }).on("rabbitCms.pageView", function(e, pageData){
	    	if(debugNer==true) console.log('META: Sayfa Görüntülendi!', cartData);
	    
	    }).on("rabbitCms.AddToWishlist", function(e, pageData){
	    	if(debugNer==true) console.log('META: Favorilere Eklendi!', wishData);
	    	fbq('track', 'AddToWishlist');
	    }).on("rabbitCms.RemoveWishlist", function(e, wishData){
	    	if(debugNer==true) console.log('META: Favorilerden Çıkartıldı!', wishData);

	    }).on("rabbitCms.productView", function(e, productData){
    		if(debugNer==true) console.log('META: Ürün Görüntülendi!', productData);
	    	fbq('track', 'ViewContent');
    	}).on("rabbitCms.emailSubscription", function(e, subscriptionData){
    		if(debugNer==true) console.log('META: E-Posta Aboneliği Yapıldı!', subscriptionData);
	    	fbq('track', 'CompleteRegistration');
	    }).on("rabbitCms.userRegister", function(e, userData){
    		if(debugNer==true) console.log('META: Yeni Üyelik Yapıldı!', userData);
	    	fbq('track', 'CompleteRegistration');
	    }).on("rabbitCms.userLogin", function(e, userData){
    		if(debugNer==true) console.log('META: Üyelik Girişi Yapıldı!', userData);
	    	fbq('track', 'CompleteRegistration');
	    }).on("rabbitCms.Purchase", function(e, purchaseData){
    		if(debugNer==true) console.log('META: Alışveriş Tamamlandı!', purchaseData);
	  		fbq('track', 'Purchase', {
	  			value 	: purchaseData.orderAmount, 
	  			currency: purchaseData.orderCurrency
	  		});
	    }).on("rabbitCms.InitiateCheckout", function(e, icData){
    		if(debugNer==true) console.log('META: Alışveriş Tamamla Butonuna Basıldı!', icData);
	    	fbq('track', 'InitiateCheckout');
    	});
	}
});