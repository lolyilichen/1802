#!/bin/bash
echo "猜大小游戏"
a=$[$RANDOM%100+1]
total=6
for total in {6..1}
do
	read -p "请输入一个1到100的正整数： " b
	if test -z $b;then
		let total--;
		echo "输入不能为空，已浪费一次机会，还有次$total机会"
	elif test $b -eq $a 2> /dev/null;then
		echo "恭喜你猜对了！" && exit
	elif test $b -gt $a 2> /dev/null && test $b -le 100 2> /dev/null;then
		let total--;
		echo "大了，您还有次$total机会"
	elif test $b -lt $a 2> /dev/null && test $b -gt 0;then
		let total--;
		echo "小了，您还有次$total机会"
	elif test $b -gt 100 2> /dev/null;then
		let total--;
		echo "输入有误，已浪费一次机会，您还有次$total机会"
	else 
		let total--;
		echo "输入有误，已浪费一次机会，您还有次$total机会"
	fi
done
echo "此次随机数为：$a"
