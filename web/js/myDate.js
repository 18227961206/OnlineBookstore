/**
 * @return {string}
 */
function Dates() {  //获取时间，用于订单号
    var myDate = new Date;
    var year = myDate.getFullYear(); //获取当前年
    var mon = myDate.getMonth() + 1; //获取当前月
    var date = myDate.getDate(); //获取当前日
    var h = myDate.getHours();//获取当前小时数(0-23)
    var m = myDate.getMinutes();//获取当前分钟数(0-59)
    var s = myDate.getSeconds();//获取当前秒
    return year.toString() + mon.toString() + date.toString() +
        h.toString() + m.toString() + s.toString() + myDate.getTime().toString();
}