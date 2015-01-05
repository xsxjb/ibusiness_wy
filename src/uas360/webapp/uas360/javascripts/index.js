/*!
 * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery to collapse the navbar on scroll
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});


// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

$(document).ready(function() {
    $('#loginForm')
        .bootstrapValidator({
            message: '这个字段的值不正确',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {

                    validators: {
                        notEmpty: {
                            message: '登录名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '登录名的长度必须介于6到20个字符之间'
                        }
                    }
                },

                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '密码的长度必须介于6到20个字符之间'
                        }
                    }
                },
                vcode: {
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        stringLength: {
                            min:4,
                            max:4,
                            message: '验证码只能有4位'
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
            $dialog.find('.info').removeClass().addClass('info loading').text('登录数据上传中。。。');
            var $btn=$('#loginBtn');
            $form.ajaxSubmit({
                url:$form.attr('action'),
                type:'POST',
                dataType:'json',
                beforeSubmit:function(){

                    $btn.prop('disabled',true);
                },
                success:function(data){

                    if(data.status==='ok'){
                        $dialog.find('.info').removeClass().addClass('info checked').text('登录成功。。。');
                        setTimeout(function(){
                            $dialog.modal('hide');

                            location.href='/main';
                        },2000);
                    }else if(data.status==='error_user'||data.status==='error_pwd'){
                        $dialog.find('.info').removeClass().addClass('info unchecked').text('登录名或密码错误。。。');
                        setTimeout(function(){
                            clearForm();
                            $dialog.modal('hide');
                        },2000);

                    }else if(data.status==='error_code'){
                        $dialog.find('.info').removeClass().addClass('info unchecked').text('验证码错误。。。');

                        setTimeout(function(){
                            clearForm();
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

    //验证码
    $('#vPng').click(function(){

            $(this).attr("src", '/vPng?'+ Math.random());

    });
});

var clearForm=function(){
    $('#vPng').trigger("click");
    $('#password').val("");
    $('#vcode').val("");
    $('.help-block').attr('data-bv-result','NOT_VALIDATED');
    $('.form-group').removeClass('has-success');
}
