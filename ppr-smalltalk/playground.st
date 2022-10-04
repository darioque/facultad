|unaMaquina sensorTermico sensorHidraulico sensorMetrico|
Transcript clear.

"Creamos los Sensores"
sensorTermico := Termico new.
sensorTermico serial: 1.
sensorTermico valorMaximo: 1000.5.
sensorTermico agregarMedida:  101.5.
sensorTermico agregarMedida: 55.5.

sensorHidraulico := Hidraulico new.
sensorHidraulico serial: 2.
sensorHidraulico valorMaximo: 1000.5.
sensorHidraulico valorMinimo: 10.5.
sensorHidraulico agregarMedida:  28.5.
sensorHidraulico agregarMedida: 1505.5.
sensorHidraulico agregarMedida: 1900.5.

sensorMetrico := Metrico new.
sensorMetrico serial: 3.
sensorMetrico valorMinimo: 8.5.
sensorMetrico agregarMedida:  28.5.
sensorMetrico agregarMedida: 9.5.

"Muestra los sensores creados"
Transcript show: sensorTermico.
Transcript cr show: sensorHidraulico.
Transcript cr show: sensorMetrico.

"Muestra las medidas correctas/incorrectas de cada sensor"
Transcript cr show: 'El sensor termico tiene ', sensorTermico medidasCorrectas asString, ' medidas correctas'.
Transcript cr show: 'El sensor termico tiene ', sensorTermico medidasIncorrectas asString, ' medidas incorrectas'.
Transcript cr.

Transcript cr show: 'El sensor hidraulico tiene ', sensorHidraulico medidasCorrectas asString, ' medidas correctas'.
Transcript cr show: 'El sensor hidraulico tiene ', sensorHidraulico medidasIncorrectas asString, ' medidas incorrectas'.
Transcript cr.

Transcript cr show: 'El sensor metrico tiene ', sensorMetrico medidasCorrectas asString, ' medidas correctas'.
Transcript cr show: 'El sensor metrico tiene ', sensorMetrico medidasIncorrectas asString, ' medidas incorrectas'.
Transcript cr.


"Crea una Maquina"
unaMaquina := Maquina new.
unaMaquina agregarSensor: sensorTermico.
unaMaquina agregarSensor: sensorHidraulico.
unaMaquina agregarSensor: sensorMetrico.

"Muestra la maquina creada"
Transcript cr show: 'Maquina1: ', String cr, unaMaquina asString.

"quita un sensor"
unaMaquina quitarSensor: 3.  

"muestra la maquina nuevamente"
Transcript cr show: 'Maquina1: ', String cr, unaMaquina asString.

"Busca e informa si existe el sensor"
(unaMaquina existeSensor: 1) ifFalse:[Transcript cr show: 'El sensor no existe en la maquina'] ifTrue:[Transcript cr show: 'El sensor existe'].
Transcript cr.
(unaMaquina existeSensor: 3) ifFalse:[Transcript cr show: 'El sensor no existe'] ifTrue:[Transcript cr show: 'El sensor existe'].
Transcript cr.

"Muestra cant de medidas correctas/incorrectas"
Transcript cr show: 'La cantidad total de medidas correctas en la maquina es de ', unaMaquina medidasCorrectas asString, ' medidas'.
Transcript cr show: 'La cantidad total de medidas incorrectas en la maquina es de ', unaMaquina medidasIncorrectas asString, ' medidas'.
Transcript cr.

"Informa si se encuentra en buen estado"
unaMaquina estaEnBuenEstado ifFalse:[Transcript cr show: 'La maquina no está en buen estado'] ifTrue:[Transcript cr show: 'La maquina está en buen estado'].
Transcript cr.

"Informa porcentaje de medidas correctas sobre incorrectas (hidraulicos)"
Transcript cr show:  'El porcentaje de medidas correctas en el sensor hidraulico es del ', unaMaquina informarPorcentajeCorrectasHidra asString.