$(function(){

    $('#realName').prop('readonly',true);
    $('#edit').click(function(){
        $('#realName').prop('readonly',false);
    });

    $('#accountForm')
        .bootstrapValidator({
            message: '这个字段的值不正确',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                realName: {

                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        regexp: {
                            regexp:  /^[\u4e00-\u9fa5]{2,10}$/,
                            message: '用户名的长度必须介于2到10个汉字之间'
                        }
                    }
                },

                email: {
                    validators: {
                        notEmpty: {
                            message: 'Email不能为空'
                        },
                        emailAddress:{
                            message:'不是有效的Email格式'
                        },
                        remote: {
                            type: 'POST',

                            url: '/vEmail',
                            message: '该Email已经被注册了',
                            delay: 1000
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '电话不能为空'
                        },
                        regexp: {
                            regexp:  /^(13|15|18)\d{9}$/,
                            message: '电话号码不符合要求'
                        },
                        remote: {
                            type: 'POST',

                            url: '/vPhone',
                            message: '该电话已经被注册了',
                            delay: 1000
                        }
                    }
                }
            }
        })
        .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            var $dialog=$('#infoDialog').modal('show');
            $dialog.find('.info').removeClass().addClass('info loading').text('账户数据上传中。。。');
            var $btn=$('#accountBtn');
            $form.ajaxSubmit({
                url:$form.attr('action'),
                type:'POST',
                dataType:'json',
                beforeSubmit:function(){

                    $btn.prop('disabled',true);
                },
                success:function(data){

                    if(data.status==='ok'){
                        $dialog.find('.info').removeClass().addClass('info checked').text('保存成功。。。');
                        setTimeout(function(){
                            $dialog.modal('hide');
                        },2000);
                    }else if(data.status==='error_email'){
                        $dialog.find('.info').removeClass().addClass('info unchecked').text('该Email已经被注册过。。。');
                        setTimeout(function(){

                            $dialog.modal('hide');
                        },2000);

                    }else if(data.status==='error_phone'){
                        $dialog.find('.info').removeClass().addClass('info unchecked').text('该电话已经被注册过。。。');
                        setTimeout(function(){

                            $dialog.modal('hide');
                        },2000);

                    }else{
                        $dialog.find('.info').removeClass().addClass('info unchecked').text('数据更新失败。。。');
                        setTimeout(function(){

                            $dialog.modal('hide');
                        },2000);
                    }
                    $btn.prop('disabled',false);
                },
                error:function(){
                    $dialog.find('.info').removeClass().addClass('info unchecked').text('数据提交失败。。。');
                    setTimeout(function(){
                        $dialog.modal('hide');
                        $btn.prop('disabled',false);
                    },2000);

                }
            });
        });

    $('#upFile').click(function(){

        $('#iconFile').trigger('click');
    });

    $('#iconFile').on('change',function(){
        var value=$(this).val();
        if(value){
            $('#photoDialog').modal('show');
            var objUrl = getObjectURL(this.files[0]) ;

            if (objUrl) {
                $(".src-photo").attr("src", objUrl) ;
            }

            crop(objUrl);

        }
    });


    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        }
        return url ;
    }

    function crop(url,w,h){
        var cropzoom = $('#crop_container').cropzoom({
            width:350,
            height:300,
            bgColor: '#CCC',
            enableRotation:true,
            enableZoom:true,
            zoomSteps:5,
            rotationSteps:10,
            selector:{
                centered:true,
                startWithOverlay: true,
                borderColor:'#ea544a',
                borderColorHover:'red',
                showPositionsOnDrag: false,
                showDimetionsOnDrag: false
            },
            image:{
                source:url,
                width:300,
                height:300,
                minZoom:10,
                maxZoom:300
            }
        });
        cropzoom.setSelector(45,45,150,150,true);
//        $('#cropBtn').click(function(){
//            cropzoom.send('/uploadIcon','POST',{},function(rta){
//               alert("上传完毕");
//            });
//        });
//       $('#cropBtn').click(function(evt){
//
//           evt.preventDefault;
//           $.ajax({
//               url: '/uploadIcon',
//               type: 'POST',
//               //data: (cropzoom.cropzoom.getParameters(cropzoom, {})),
//               success: function (r) {
//                   alert('ok');
//               }
//           });
//       });
    }
});

