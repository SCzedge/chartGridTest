/**
 * 
 */
function fn_common_send(url,method,param){
    result;
    console.log(param);
    $.ajax({
        url : marsUrl+url,
        method : method,
        dataType : 'JSON',
        data : param,
        async: false, 
        beforeSend: function (xhr) {
            //xhr.setRequestHeader("Content-type","application/json");
            xhr.setRequestHeader("X-AUTH-TOKEN",authToken);
        },
        success: function(data){
            result = data;
        },
        error: function(data){
            result = data;
        }
    })
    return result;
}
