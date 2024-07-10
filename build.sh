#!/bin/sh

cd x86_64

rm -f aster-repo*

repo-add -s -R -n -k  DCB6D09D1EEB4C76EFEDC65AEF8B1E906442569F aster-repo.db.tar.zst *.tar.zst


count=0
for name in $(ls *.tar.zst); do
	count=$[count+1]
	if [ ! -f $name.sig ];then	
		tput setaf 6;echo $count " : signing " $name;tput sgr0;
		gpg --detach-sign $name
	fi
done

repo-add -n -R -v -s aster-repo.db.tar.gz *.pkg.tar.zst
rm aster-repo.db
rm aster-repo.db.sig
rm aster-repo.files
rm aster-repo.files.sig
mv aster-repo.db.tar.gz aster-repo.db
mv aster-repo.db.tar.gz.sig aster-repo.db.sig
mv aster-repo.files.tar.gz aster-repo.files
mv aster-repo.files.tar.gz.sig aster-repo.files.sig
