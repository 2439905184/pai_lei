import sequtils
import strutils
#注：文本出自盛开的钢琴之森下游戏
# var a = ["去唤醒她吗","她也很累啦，就让她睡吧"]
# var b = ["总之去探险把","老是待在房间里会生病的呀","补充测试选项"]
var a = [1,2]
var b = [4,5,6]
#数学：分步技术原理
var all_options = len(a) * len(b)
#echo all_options

#var result:seq[string]
var result:seq[int]
var a_index = 0
var b_index = 0

#a起始
while a_index < len(a):
  for item in b:
    result.add(a[a_index])
    result.add(item)
  a_index += 1
echo "结果",result

  #echo result.distribute(len(a))

proc write_result(file:string) = 
  #切割结果，按分步显示
  var File = open(file,fmReadWrite)
  for index,item in result.distribute(len(a)):
    var fb = index + 1
    echo "分步", fb, ":",item
    var file_str = $item
    file_str = file_str.split('@')[1]
    File.write(file_str & "\n")
  File.close()
write_result("result.txt")