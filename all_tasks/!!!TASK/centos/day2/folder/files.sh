cd /home/student
name=`cat student`
mkdir ./$name
mkdir ./$name/{1..100}
cd ./$name/10
dd if=/dev/zero of=test1 bs=1024 count=1
cd ..
cd ./20
dd if=/dev/zero of=test2 bs=1024K count=1
cd ..
cd ./30
dd if=/dev/zero of=test3 bs=10240K count=1
cd /home/student
mkdir -p centos/day2
find . -cmin 60 > ./centos/day2/1h.txt
find . -size +5M > ./centos/day2/5M.txt
cd /home/student/$name
tar cfvz ./mytest.tar.gz ./10/test1 ./20/test2
gunzip ./mytest.tar.gz
tar -rf ./mytest.tar ./30/test3
gzip ./mytest.tar
mkdir ./mytest
sudo mv ./mytest.tar.gz ./mytest
cd ./mytest
tar xf mytest.tar.gz

