#!/usr/local/bin/bash

if [ $# -lt 2 ]; 
then
    echo "Usage: ./interval_exercise.sh exercise_time rest_time"
    exit
fi

# seconds to exercise
exercise_time=$1
# seconds to rest between exercies
rest_time=$2
# warning before exercise ends
warn_time=10

tone() {
    # play an A for half a second
    play -n synth .5 sin 880 >/dev/null 2>&1
}

# put all exercises in an array
exercises=( \
    "Jumping jacks" \
    "Wall sit" \
    "Push ups" \
    "Crunches" \
    "Step ups" \
    "Squats" \
    "Tricep dips" \
    "Plank" \
    "High knees" \
    "Lunges" \
    "Push ups with rotation" \
    "Side planks" \
)

say Ready?
sleep 2

for exercise in "${exercises[@]}"; do
    # announce exercise coming up
    say ${exercise} coming up in ${rest_time} seconds
    sleep ${rest_time}

    # announce exercise and duration, begin
    say ${exercise} for ${exercise_time} seconds
    say Ready?
    tone

    if [ $(( $exercise_time / 2 )) -ge $warn_time ];
    then
        # sleep during exercise
        sleep $(expr ${exercise_time} - ${warn_time})

        # give warning for finishing
        say ${warn_time} seconds left
        sleep ${warn_time}
    else
        sleep ${exercise_time}
    fi

    # finish!
    tone
    say Done
done

