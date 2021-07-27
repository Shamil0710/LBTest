-- Запрос выводящий всех пилотов общий налет которых привышает 80 часов
SELECT pilots.pilot_id, SUM(EXTRACT(HOUR FROM (flight_ending - flight_start))) as flight_time
FROM air_base.flights
         JOIN air_base.pilots ON pilots.crew_id = flights.crew_id
GROUP BY pilots.pilot_id
HAVING SUM(EXTRACT(HOUR FROM (flight_ending - flight_start))) > 80
ORDER BY pilots.pilot_id

-- Запрос с дополнительным bool флагом для привышивших налёт в 80 часов
SELECT pilots.pilot_id, SUM(EXTRACT(HOUR FROM (flight_ending - flight_start))) as flight_time,
       SUM(EXTRACT(HOUR FROM (flight_ending - flight_start))) > 80 as bul
FROM air_base.flights
         JOIN air_base.pilots ON pilots.crew_id = flights.crew_id
GROUP BY pilots.pilot_id
HAVING SUM(EXTRACT(HOUR FROM (flight_ending - flight_start))) > 80
ORDER BY pilots.pilot_id