echo "パスワードマネージャーへようこそ！"

while :
do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read input
    case "$input" in
        "Add Password" )
            echo "サービス名を入力してください："
            read service_name 
            echo "ユーザー名を入力してください："
            read user_name 
            echo "パスワードを入力してください："
            read password
            echo $service_name:$user_name:$password >> password_manager.txt
            echo "パスワードの追加は成功しました。" 
            ;;
    
        "Get Password" )
            echo "サービス名を入力してください："
            read service_name
            cut -f 1 -d ":" password_manager.txt | grep -q "^$service_name"
           
            if [ $? = 1 ]; then
                echo "そのサービスは登録されていません。"
            else
                user_name=$(grep "^$service_name" password_manager.txt | cut -f 2 -d ":")
                password=$(grep "^$service_name" password_manager.txt | cut -f 3 -d ":")

                echo "サービス名：$service_name"
                echo "ユーザー名：$user_name"
                echo "パスワード：$password"
            fi
            ;;

        "Exit" )
            echo "Thank you!"
            break ;;
    
        * ) echo "入力が間違えています。 Add Password/Get Password/Exit から入力してください。" ;;
    esac
done