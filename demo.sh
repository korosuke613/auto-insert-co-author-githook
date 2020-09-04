git config --local user.email "you@example.com"
git config --local user.name "Your Name"
echo aaa > test.txt
git add -A && git commit -m "iam A"
git config --local user.email "you2@example.com"
git config --local user.name "Your Name2"
echo bbb >> test.txt
git add -A && git commit -m "iam B"
git config --local user.email "you3@example.com"
git config --local user.name "Your Name3"
echo ccc >> test.txt
git add -A && git commit -m "iam C"

