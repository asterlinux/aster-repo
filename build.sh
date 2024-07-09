#!/bin/sh

cd x86_64

rm -f aster-repo*

repo-add -s -R -n -k  DCB6D09D1EEB4C76EFEDC65AEF8B1E906442569F aster-repo.db.tar.zst *.tar.zst

rm aster-repo.db
rm aster-repo.db.sig
rm aster-repo.files
rm aster-repo.files.sig

mv aster-repo.db.tar.zst aster-repo.db
mv aster-repo.db.tar.zst.sig aster-repo.db
mv aster-repo.files.tar.zst aster-repo.files
mv aster-repo.files.tar.zst.sig aster-repo.files.sig



