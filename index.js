const {spawn} = require('child_process');
//const bat = spawn('cmd.exe', ['/c', 'my.bat']);

const proxy = ' -x 127.0.0.1:1080'
let info_way = ' -i '
let get_way=' --itag '
const url = '"https://www.youtube.com/watch?v=JG6HTvzcWCI"'
/*
const youget=spawn('cmd.exe',['/c','./you-get.exe','-i',url])
youget.stdout.on('data',(data)=>{
  console.log(data.toString());
})
const { exec } = require('child_process');
exec('"./you-get.exe"'+proxy+' '+'-i'+' '+url, (err, stdout, stderr) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(stdout);
});
*/
/*
//传递过去的参数不知道怎么只有前三个
const bat = spawn('cmd.exe', ['/c', 'you-get.bat',proxy+way+url]);

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
const {exec} = require('child_process');

let you_get_info = function (url) {
  return new Promise(function (resolve, reject) {
    exec('you-get_info.bat' + proxy + info_way +url, (err, stdout, stderr) => {
      if (err) {
        reject(err)
        return;
      }
      //代表了这个最顶上的数字 跳过4还有问题,具体跳过多少个还需要修改
      resolve(stdout.split('\n')[4].split(' ').pop().split('\r')[0]);
    });
  });
};

let you_get_get = function (url,itag) {
  return new Promise(function (resolve, reject) {
    exec('you-get_get.bat' + proxy + get_way +itag+' '+ url, (err, stdout, stderr) => {
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
  console.log(download)
}
youget()