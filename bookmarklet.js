javascript: (function () {
  let url=document.location;
  if (url.indexOf('youtube.com')>=0){
    alert(1);
  }else{
    alert(2);
  };
  window.location='youget://""'+url+'"';
  /*window.navigate('youget://""'+url+'"');*/
  /*window.location.replace('youget://""'+url+'"');*/
})();

第一个不生效不知道为什么

javascript:(function(){if(location.href.indexOf("youtube")>=0||location.href.indexOf("twitter")>=0||location.href.indexOf("tumblr")>=0||location.href.indexOf("instagram")>=0||location.href.indexOf("facebook")>=0){location.href='youget://"1"'+location.href+'"';}else if(location.href.indexOf("bilibili.com/video/av")>=0||location.href.indexOf("music.163.com")>=0||location.href.indexOf("miaopai.com")>=0||location.href.indexOf("video.weibo.com")>=0||location.href.indexOf("video.sina.com")>=0){location.href='youget://"0"'+location.href+'"';}else{alert('Not Downloads Pages');}})();
