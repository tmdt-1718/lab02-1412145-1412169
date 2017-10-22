if (($('#sent-message-list').length)) {
            setInterval(function() {
                $.ajax({
                    url: "/messages?view=sentlistjson",
                    dataType: 'json',
                    success: function(list){
                        // alert(result.length);
                        if (list.length > 0) {
                            var htmlContent = "";
                            for (var i = 0; i < list.length; i++) {
                                htmlContent += '<div class="row my-message-detail"><div class="view-message dont-show col-sm-2 col-md-2 col-lg-2 my-message"><span class="inbox-small-cells"><input type="checkbox" class="mail-checkbox"></span> <a class="my-message-link" href="/messages/'

                                htmlContent += list[i].message_content.id + '">'

                                htmlContent += list[i].recipient.fullname

                                htmlContent += '</a></div><div class="view-message col-sm-1 col-md-1 col-lg-1 my-message"><button class="btn btn-sm btn-light pull-left"><font color="lightgray">Sent</font></button></div><div class="view-message col-sm-6 col-md-6 col-lg-6 my-message"><a class="my-message-link" href="/messages/'

                                htmlContent += list[i].message_content.id + '">'

                                var truncatedContent = list[i].message_content.body;

                                if (truncatedContent.length > 50) {
                                    truncatedContent = truncatedContent.slice(0, 50) + "...";
                                }

                                htmlContent += truncatedContent;

                                htmlContent += '</a></div><div class="view-message text-right col-sm-3 col-md-3 col-lg-3 my-message"><a class="my-message-link" href="/messages/'

                                htmlContent += list[i].message_content.id + '">'

                                htmlContent += '<a class="my-message-link" href="/messages/' + list[i].message_content.id + '">'

                                htmlContent += list[i].message_content.created_at

                                htmlContent += '</a></a></div></div>'

                            }
                            $('#sent-message-list').html(htmlContent);
                        }
                        
                    }});
            }, 5000);
        }


if (($('#recieved-message-list').length)) {
            setInterval(function() {
                $.ajax({
                    url: "/messages?view=recievedlistjson",
                    dataType: 'json',
                    success: function(list){
                        // alert(result.length);
                        if (list.length > 0) {
                            var htmlContent = "";
                            for (var i = 0; i < list.length; i++) {
                                if (list[i].message_content.unread) {
                                    htmlContent += '<div class="unread-message">'
                                }
                                else {
                                    htmlContent += '<div class="">'
                                }

                                htmlContent += '<div class="row my-message-detail"><div class="view-message dont-show col-sm-2 col-md-2 col-lg-2 my-message"><span class="inbox-small-cells"><input type="checkbox" class="mail-checkbox"></span> <a class="my-message-link" href="/messages/'

                                htmlContent += list[i].message_content.id + '">'

                                htmlContent += list[i].sender.fullname

                                if (list[i].message_content.unread) {
                                    htmlContent += '</a></div><div class="view-message col-sm-1 col-md-1 col-lg-1 my-message"><button class="btn btn-sm btn-danger pull-left">New&nbsp;</button></div><div class="view-message col-sm-6 col-md-6 col-lg-6 my-message"><a class="my-message-link" href="/messages/'
                                }
                                else {
                                    htmlContent += '</a></div><div class="view-message col-sm-1 col-md-1 col-lg-1 my-message"><button class="btn btn-sm btn-light pull-left"><font color="lightgray">Seen</font></button></div><div class="view-message col-sm-6 col-md-6 col-lg-6 my-message"><a class="my-message-link" href="/messages/'
                                }
                                

                                htmlContent += list[i].message_content.id + '">'

                                var truncatedContent = list[i].message_content.body;

                                if (truncatedContent.length > 50) {
                                    truncatedContent = truncatedContent.slice(0, 50) + "...";
                                }

                                htmlContent += truncatedContent;

                                htmlContent += '</a></div><div class="view-message text-right col-sm-3 col-md-3 col-lg-3 my-message"><a class="my-message-link" href="/messages/'

                                htmlContent += list[i].message_content.id + '">'

                                htmlContent += '<a class="my-message-link" href="/messages/' + list[i].message_content.id + '">'

                                htmlContent += list[i].message_content.created_at

                                htmlContent += '</a></a></div></div></div>'

                            }
                            $('#recieved-message-list').html(htmlContent);
                        }
                        
                    }});
            }, 5000);
        }