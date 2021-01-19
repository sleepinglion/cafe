I18n.translations || (I18n.translations = {});
I18n.translations["ko"] = I18n.extend((I18n.translations["ko"] || {}), {"display":"표시함","hidden":"숨김"});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"display":"표시함","hidden":"숨김"});
I18n.translations["zh-CN"] = I18n.extend((I18n.translations["zh-CN"] || {}), {"display":"표시함","hidden":"숨김"});

$(document).ready(function(){
    $('.custom-file-input').on('change', function() {
        let fileName = $(this).val().split('\\').pop();
        $(this).next('.custom-file-label').addClass("selected").html(fileName);
    });

    $(document).on('change', '.custom-control-input', function (e) {
        let c_checked = e.target.checked;

        if(window.location.port!=80) {
            var port=':' + window.location.port;
        } else {
            var port='';
        }

        if(c_checked) {
            $(this).parent().find('.custom-control-label').text(I18n.t('display')).effect('highlight');
        } else {
            $(this).parent().find('.custom-control-label').text(I18n.t('hidden')).effect('highlight');
        }

        var param={_method: 'put', authenticity_token:$('meta[name="csrf-token"]').attr('content')}
        var path=window.location.pathname.split('/')[1];
        var url=window.location.protocol+'//'+window.location.hostname+port+'/'+path+'/'+$(this).val()+'.json';
        var aa={products:'product',product_categories:'product_category',users:'user'}

        param[aa[path]]={display:c_checked};
        $.post(url,param,function(data){

        },'json');
    });

    $('#myModal').on('show.bs.modal', function (e) {
        if (!data) return e.preventDefault(); // stops modal from being shown

        if($(this).attr('title')) {
            $('#myModal .modal-header h3').text($(this).attr('title'));
        } else {
            $('#myModal .modal-header h3').text('사용자정보');
        }
    });

    $('.btn-maximize').click(function(){
        $(this).parent().parent().parent().find('.box-content').slideDown();
        $(this).find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
        return false;
    });

    $(".btn-close").click(function(){
        $(this).parent().parent().parent().remove();
        return false;
    });

    $('.dropmenu').click(function(e){
        if(!$(this).parent().find('ul:first').hasClass('d_show')) {
            $(this).parent().parent().find('.d_show').removeClass('d_show').slideToggle();
            $(this).parent().find('ul').addClass('d_show').slideToggle(function(){
                $("#content").css("min-height",$('aside').height()+40);
            });

        }
    });

    $('.input-group .input-group-prepend').click(function(){
        $(this).parent().find('input').trigger('focus');
    });

    $("#p_logout").click(function() {
        localStorage.removeItem('orders');
    });

    $("#messages .alert-success").fadeOut(5000,function(){
        var as=$(this);
        $("#messages").slideUp('slow',function(){
            as.remove();
            $("#messages").slideDown();
        });
    });
});