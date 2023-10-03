echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください：" 
read service_name
echo $service_name >> password_manager.txt
echo "ユーザー名を入力してください：" 
read user_name
echo $user_name >> password_manager.txt
echo "パスワードを入力してください：" 
read password
echo $password >> password_manager.txt
echo "Thank you!"