declare -i steps=1
declare -i number
declare -i count_of_hit=0
declare -i count_of_miss=0
declare -i total=0
declare -i hit_percent=0
declare -i miss_percent=0
declare -a numbers

RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'

while :
do
    number=${RANDOM: -1}
    echo "Step: ${steps}"
    read -p "Please enter number from 0 to 9 (q - quit): " prediction

    case "${prediction}" in
        [0-9])

            if [[ "${prediction}" == "${number}" ]] # проверяем число
                then
                    count_of_hit+=1
                    number_with_color="${GREEN}${number}${RESET}" # верные выделяем зеленым
                    echo "Hit! My number: ${number}"
                else
                    count_of_miss+=1
                    number_with_color="${RED}${number}${RESET}" # неверные выделяем красным
                    echo "Miss! My number: ${number}"
            fi

            numbers+=(${number_with_color}) # добавляем в конец массива
            total+=1

            miss_percent=count_of_miss*100/total # высчитываем процент неверных ответов
            hit_percent=100-miss_percent # высчитываем процент верных ответов

            echo "Hit: ${hit_percent}% Miss: ${miss_percent}%"

            if (( total < 10 ))
                then
                    echo -e "Numbers: ${numbers[@]: -total}"
                else
                    echo -e "Numbers: ${numbers[@]: -10}"
            fi

            steps+=1
        ;;
        q)
            echo "You are out of the game."
            exit 0
        ;;
        *)
            echo "Error! Try again!"
        ;;
    esac
done
