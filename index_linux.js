const {spawn} = require('child_process');
const proxy ='-x 127.0.0.1:8087 '
const url = '"https://www.youtube.com/watch?v=AjUcgiZ1dWc"'
/*
//传递过去的参数不知道怎么只有前三个 直接传递url 等号后面的识别不了
const bat = spawn('cmd.exe', ['/c', 'you-get.bat '+url]);

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
const {exec} = require('child_process');

let you_get_get = function (url) {
  return new Promise(function (resolve, reject) {
    exec('you-get '+proxy+url, (err, stdout, stderr) => {
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
  let download =await you_get_get(url);
  console.log(download)
}
youget()
