<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script src="/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<link href="/resources/plugins/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
 

</head>

<body>
<h1>
수정 페이지
</h1>
<p>
${productVO}
</p>


<input id="fileupload" type="file" name="files[]" data-url="/resources/plugins/jQuery-File-Upload-9.18.0/js/server/php" multiple>

<script src="/resources/plugins/jQuery-File-Upload-9.18.0/js/vendor/jquery.ui.widget.js"></script>
<script src="/resources/plugins/jQuery-File-Upload-9.18.0/js/jquery.iframe-transport.js"></script>
<script src="/resources/plugins/jQuery-File-Upload-9.18.0/js/jquery.fileupload.js"></script>
<script>
$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo(document.body);
            });
        }
    });
});


$('#fileupload').fileupload({
    /* ... */
    progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css(
            'width',
            progress + '%'
        );
    }
});


</script>


</body>
</html>











