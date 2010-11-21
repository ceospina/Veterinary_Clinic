tinyMCE.init({
    theme:"advanced",
    mode:"textareas",
  // plugins : 'style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras',
   plugins : "fullpage",
    //plugins : "style",
    //theme_advanced_buttons3_add : "styleprops"


    theme_advanced_buttons3_add : "fullpage",
    content_css : "#{Rails.root}/public/stylesheets/custom.css",
    inline_styles : true



});