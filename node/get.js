const {spawn} = require('child_process');
//const bat = spawn('cmd.exe', ['/c', 'my.bat']);

const proxy = ' -x 127.0.0.1:1080'
let info_way = ' -i '
let get_way=' --itag '
const url = '"https://www.youtube.com/watch?v=JG6HTvzcWCI"'
const youtube_url = 'https://www.youtube.com/watch?v=JG6HTvzcWCI'
//如果用spawn不能再套一层双引号
const bili_url ='http://www.bilibili.com/video/av11666683/'

//const youget=spawn('cmd.exe',['/c','you-get','-i','http://www.bilibili.com/video/av11666683/'])
//const youget=spawn('cmd.exe',['/c','you-get','-x','127.0.0.1:1080','--itag','43',youtube_url])
const youget=spawn('cmd.exe',['/u','/c','you-get','-x','127.0.0.1:1080','--itag','43',youtube_url])
// 即使是/u还是解决不了编码问题
youget.stdout.on('data',(data)=>{
  console.log(data.toString());
})
youget.stderr.on('data', (data) => {
  console.log(data.toString());
});

youget.on('exit', (code) => {
  console.log(`Child exited with code ${code}`);
});

/*
const { exec } = require('child_process');
exec('"./you-get.exe"'+proxy+' '+'-i'+' '+url, (err, stdout, stderr) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(stdout);
});

/*
//传递过去的参数不知道怎么只有前三个
//const bat = spawn('you-get', ['-x','127.0.0.1:1080','-i',bili_url]);
//const bat = spawn('you-get', ['-x','127.0.0.1:1080','-i',youtube_url]);
const bat = spawn('you-get', ['-x','127.0.0.1:1080','--itag','43',youtube_url]);
//spawn 还是解决不了编码问题
bat.stdout.on('data', (data) => {
  console.log(data.toString());
});

bat.stderr.on('data', (data) => {
  console.log(data.toString());
});

bat.on('exit', (code) => {
  console.log(`Child exited with code ${code}`);
});
*/
//问题在于编码不是utf fuck 原来不是编码的问题,是那个video的编码就不能处理
/*
const {exec} = require('child_process');

let you_get_info = function (url) {
  return new Promise(function (resolve, reject) {
    exec('you-get' + proxy + info_way +url, (err, stdout, stderr) => {
      if (err) {
        reject(err)
        return;
      }
      console.log(stdout)
      if(stdout.split('\n')[3].split(' ')[5]=='itag:'){
        resolve(stdout.split('\n')[3].split(' ').pop().split('\r')[0])
      }else{
        resolve(stdout.split('\n')[4].split(' ').pop().split('\r')[0]);
      }
      //代表了这个最顶上的数字 跳过4还有问题,具体跳过多少个还需要修改
      //resolve(stdout.split('\n')[4].split(' ').pop().split('\r')[0]);
    });
  });
};

let you_get_get = function (url,itag) {
  return new Promise(function (resolve, reject) {
    exec('you-get' + proxy + get_way +itag+' '+ url, (err, stdout, stderr) => {
      if (err) {
        reject(err)
        return;
      }
      //代表了这个最顶上的数字
      resolve(stdout);
    });
  });
};
let youget=async ()=>{
  let itag = await you_get_info(url)
  console.log(itag);
  let download =await you_get_get(url,itag);
  //console.log(download)
}
youget()
*/