# cpm  (https://github.com/comotion/cpm 
# apt-get install cpm
# 
function CPM_DUMP()
{
gpg --decrypt ~/.cpmdb | gzip -cd | xmllint --format
}
