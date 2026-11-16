
weather('Москва', 5, дождь, 7).
weather('Санкт-Петербург', 2, снег, 12).
weather('Казань', -3, снег, 4).
% Задание 1: добавление Екатеринбурга (температура -15, снег, и зададим ветер, например, 6 м/с)
weather('Екатеринбург', -15, снег, 6).


% Рекомендация по температуре
temp_advice(Temp, 'Очень холодно, одевайтесь максимально тепло!') :- Temp < -10.
temp_advice(Temp, 'Холодно, наденьте тёплую куртку и шапку.') :- Temp >= -10, Temp < 0.
temp_advice(Temp, 'Прохладно, возьмите ветровку или легкую куртку.') :- Temp >= 0, Temp < 10.
temp_advice(Temp, 'Тепло, можно гулять в джемпере или рубашке.') :- Temp >= 10, Temp < 20.
temp_advice(Temp, 'Жарко, лучше надеть футболку и шорты.') :- Temp >= 20.

% Рекомендация по погодному явлению
cond_advice(дождь, 'Возьмите зонт, ожидается дождь.').
cond_advice(снег, 'Осторожно, снегопад, будьте аккуратны на дорогах.').
cond_advice(солнечно, 'Не забудьте солнечные очки и головной убор!').
cond_advice(облачно, 'Погода облачная, осадков не ожидается.').

% Задание 2: Рекомендация по скорости ветра
wind_advice(Wind, 'Сильный ветер, будьте осторожны!') :- Wind > 10.
wind_advice(Wind, 'Ветрено, застегните куртку.') :- Wind >= 5, Wind =< 10.
wind_advice(Wind, 'Ветер слабый, комфортно.') :- Wind < 5.

% Задание 3: Рекомендация активности
activity_advice(Temp, солнечно, 'Идеально для пляжа!') :- Temp > 20.
activity_advice(Temp, дождь, 'Можно посетить музей или кафе.') :- Temp >= 15, Temp =< 25.
activity_advice(Temp, снег, 'Хорошая погода для катания на лыжах.') :- Temp < 0.
activity_advice(_, _, 'Можно просто погулять по городу.'). % резервное правило для остальных случаев


advice_for(City, FullAdvice) :-
    weather(City, Temp, Cond, Wind),
    temp_advice(Temp, TempPart),
    cond_advice(Cond, CondPart),
    wind_advice(Wind, WindPart),
    activity_advice(Temp, Cond, ActivityPart),
    atomic_list_concat([TempPart, ' ', CondPart, ' ', WindPart, ' ', ActivityPart], FullAdvice).

show_all_advices :-
    forall(weather(City, _, _, _),
           (   advice_for(City, Advice),
               format('~w: ~w~n', [City, Advice])
           )).