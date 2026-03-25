// lib/data/lessons_data.dart
class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String hint;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.hint,
  });
}

class LessonData {
  final int id;
  final String title;
  final String biblicalReference;
  final String biblicalText;
  final String explanation;
  final List<QuizQuestion> questions;

  const LessonData({
    required this.id,
    required this.title,
    required this.biblicalReference,
    required this.biblicalText,
    required this.explanation,
    required this.questions,
  });
}

final Map<int, LessonData> lessonsDatabase = {
  1: LessonData(
    id: 1,
    title: 'La Creación',
    biblicalReference: 'Génesis 1:1-3 (RVR1960)',
    biblicalText:
        '"En el principio creó Dios los cielos y la tierra. Y la tierra estaba desordenada y vacía, y las tinieblas estaban sobre la faz del abismo, y el Espíritu de Dios se movía sobre la faz de las aguas. Y dijo Dios: Sea la luz; y fue la luz."',
    explanation:
        'La Biblia comienza con una declaración poderosa: Dios es el Creador de todo lo que existe. En un principio, el mundo no tenía forma y estaba en oscuridad, pero a través de Su palabra ("Y dijo Dios"), Él trajo orden, vida y luz. Esta lección nos enseña que Dios tiene el poder de transformar el caos en algo hermoso y con propósito.',
    questions: [
      const QuizQuestion(
        question: '¿Cuál es el primer libro de la Biblia donde se narra la creación?',
        options: [
          'A) Éxodo',
          'B) Génesis',
          'C) Apocalipsis',
          'D) Salmos'
        ],
        correctIndex: 1, // B
        hint: 'El nombre del libro significa "Principio" o "Origen".',
      ),
      const QuizQuestion(
        question: 'Según el versículo 1, ¿qué creó Dios en el principio?',
        options: [
          'A) Los animales y las plantas',
          'B) El sol y la luna',
          'C) Los cielos y la tierra',
          'D) Al hombre y a la mujer'
        ],
        correctIndex: 2, // C
        hint: 'Se refiere a todo el universo físico y espiritual de forma general.',
      ),
      const QuizQuestion(
        question: '¿Cómo se describe el estado de la tierra antes de que Dios actuara?',
        options: [
          'A) Llena de flores y frutos',
          'B) Desordenada y vacía',
          'C) Habitada por gigantes',
          'D) Cubierta de fuego'
        ],
        correctIndex: 1, // B
        hint: 'Revisa el versículo 2; era un estado de caos inicial.',
      ),
      const QuizQuestion(
        question: '¿Qué se movía sobre la faz de las aguas en el principio?',
        options: [
          'A) Un gran pez',
          'B) El viento fuerte',
          'C) El Espíritu de Dios',
          'D) Un barco'
        ],
        correctIndex: 2, // C
        hint: 'Es la presencia divina que trae orden al abismo.',
      ),
      const QuizQuestion(
        question: '¿Qué fue lo primero que Dios creó por medio de Su palabra?',
        options: [
          'A) Las estrellas',
          'B) Las plantas',
          'C) La luz',
          'D) Los pájaros'
        ],
        correctIndex: 2, // C
        hint: 'Es lo opuesto a las "tinieblas".',
      ),
      const QuizQuestion(
        question: '¿Cómo creó Dios todas las cosas según este pasaje?',
        options: [
          'A) Usando herramientas de madera',
          'B) Con la ayuda de los ángeles',
          'C) Hablando (Diciendo su palabra)',
          'D) Por accidente'
        ],
        correctIndex: 2, // C
        hint: '"Y dijo Dios: Sea la luz".',
      ),
      const QuizQuestion(
        question: '¿Qué había sobre la faz del abismo antes de la luz?',
        options: [
          'A) Tinieblas',
          'B) Nubes de lluvia',
          'C) Ciudades antiguas',
          'D) El sol'
        ],
        correctIndex: 0, // A
        hint: 'Es la ausencia total de iluminación.',
      ),
      const QuizQuestion(
        question: '¿Cuántos días tardó Dios en completar toda la creación según los capítulos siguientes de Génesis?',
        options: [
          'A) 1 día',
          'B) 7 días (descansando el último)',
          'C) 10 días',
          'D) 100 años'
        ],
        correctIndex: 1, // B
        hint: 'Es el número que define nuestra semana actual.',
      ),
      const QuizQuestion(
        question: '¿Quién es el personaje principal y único creador en este relato?',
        options: [
          'A) Adán',
          'B) El azar',
          'C) Dios',
          'D) Moisés'
        ],
        correctIndex: 2, // C
        hint: 'Es el nombre con el que inicia el primer versículo de la Biblia.',
      ),
      const QuizQuestion(
        question: '¿Qué frase se repite constantemente cuando Dios ve lo que ha creado (en el resto del capítulo)?',
        options: [
          'A) "Y vio Dios que era bueno"',
          'B) "Y Dios se arrepintió"',
          'C) "Y nada funcionó"',
          'D) "Y el hombre ayudó"'
        ],
        correctIndex: 0, // A
        hint: 'Dios siempre está satisfecho con Su obra perfecta.',
      ),
    ],
  ),
  2: LessonData(
    id: 2,
    title: 'El Arca de Noé',
    biblicalReference: 'Génesis 6:13-14, 19 (RVR1960)',
    biblicalText:
        '"Dijo, pues, Dios a Noé: He decidido el fin de todo ser... Hazte un arca de madera de gofer; harás aposentos en el arca, y la calafatearás con brea por dentro y por fuera. Y de todo lo que vive, de toda carne, dos de cada especie meterás en el arca, para que tengan vida contigo; macho y hembra serán."',
    explanation:
        'Debido a que la maldad de la humanidad había crecido mucho, Dios decidió enviar un gran diluvio para limpiar la tierra. Sin embargo, Noé era un hombre justo que halló gracia ante los ojos de Dios. Dios le dio instrucciones precisas para construir un barco gigante (el Arca) para salvar a su familia y a una pareja de cada especie de animal. Esta historia nos habla de la obediencia de Noé y de la protección de Dios para quienes le siguen.',
    questions: [
      const QuizQuestion(
        question: '¿Quién fue el hombre al que Dios le ordenó construir el Arca?',
        options: [
          'A) Abraham',
          'B) Moisés',
          'C) Noé',
          'D) David'
        ],
        correctIndex: 2, // C
        hint: 'Su nombre rima con "fe" y fue quien sobrevivió al diluvio.',
      ),
      const QuizQuestion(
        question: '¿De qué material debía ser construida el Arca según el texto?',
        options: [
          'A) Hierro y acero',
          'B) Madera de gofer',
          'C) Ladrillo y cemento',
          'D) Piedras preciosas'
        ],
        correctIndex: 1, // B
        hint: 'Fue un tipo de madera muy resistente mencionada en el versículo 14.',
      ),
      const QuizQuestion(
        question: '¿Con qué sustancia debía sellar Noé el Arca por dentro y por fuera?',
        options: [
          'A) Pintura blanca',
          'B) Lodo',
          'C) Brea (resina)',
          'D) Aceite de oliva'
        ],
        correctIndex: 2, // C
        hint: 'Es un material pegajoso y negro que sirve para impermeabilizar y evitar que entre el agua.',
      ),
      const QuizQuestion(
        question: '¿Cuántos animales de cada especie debía meter Noé como mínimo (macho y hembra)?',
        options: [
          'A) Uno solo',
          'B) Dos (la pareja)',
          'C) Diez',
          'D) Todos los que cupieran'
        ],
        correctIndex: 1, // B
        hint: 'Dios quería que los animales pudieran reproducirse después, así que envió un par.',
      ),
      const QuizQuestion(
        question: '¿Por qué decidió Dios enviar el diluvio sobre la tierra?',
        options: [
          'A) Porque tenía mucha sed',
          'B) Por la gran maldad y violencia de los hombres',
          'C) Porque quería crear más peces',
          'D) Porque los hombres eran muy inteligentes'
        ],
        correctIndex: 1, // B
        hint: 'El pecado y el alejamiento de Dios causaron este juicio.',
      ),
      const QuizQuestion(
        question: '¿Cómo se llamaba el fenómeno natural (mucha lluvia) que inundó la tierra?',
        options: [
          'A) Terremoto',
          'B) Huracán',
          'C) Diluvio',
          'D) Sequía'
        ],
        correctIndex: 2, // C
        hint: 'Fue una inundación global que duró muchos días.',
      ),
      const QuizQuestion(
        question: '¿Quiénes de la familia de Noé entraron en el Arca?',
        options: [
          'A) Solo él',
          'B) Él, su esposa, sus hijos y sus nueras',
          'C) Todo su pueblo',
          'D) Nadie, él entró solo con los animales'
        ],
        correctIndex: 1, // B
        hint: 'En total fueron 8 personas las que se salvaron.',
      ),
      const QuizQuestion(
        question: '¿Qué señal puso Dios en el cielo después del diluvio como promesa de no volver a destruir la tierra con agua?',
        options: [
          'A) Una nube negra',
          'B) Un rayo',
          'C) El arcoíris',
          'D) Un cometa'
        ],
        correctIndex: 2, // C
        hint: 'Tiene muchos colores y aparece después de la lluvia.',
      ),
      const QuizQuestion(
        question: '¿Cómo demostró Noé su fe ante Dios?',
        options: [
          'A) Quejándose por el trabajo',
          'B) Siendo obediente y construyendo el Arca aunque no llovía',
          'C) Escapando a otro país',
          'D) Pidiendo dinero a sus vecinos'
        ],
        correctIndex: 1, // B
        hint: 'Noé confió en la palabra de Dios y trabajó durante años en el barco.',
      ),
      const QuizQuestion(
        question: '¿Qué ave envió Noé primero para ver si las aguas habían bajado?',
        options: [
          'A) Un águila',
          'B) Un cuervo',
          'C) Un colibrí',
          'D) Un pingüino'
        ],
        correctIndex: 1, // B
        hint: 'Es un ave negra que no regresó pronto al Arca.',
      ),
    ],
  ),
  3: LessonData(
    id: 3,
    title: 'El Llamado de Abraham',
    biblicalReference: 'Génesis 12:1-2 (RVR1960)',
    biblicalText:
        '"Pero Jehová había dicho a Abram: Vete de tu tierra y de tu parentela, y de la casa de tu padre, a la tierra que yo te mostraré. Y haré de ti una nación grande, y te bendeciré, y engrandeceré tu nombre, y serás bendición."',
    explanation:
        'Dios llamó a un hombre llamado Abram (quien más tarde se llamaría Abraham) para que dejara su hogar y viajara a un lugar desconocido. A cambio, Dios le prometió tres cosas principales: una gran descendencia (muchos hijos y nietos), una tierra propia y que a través de él todas las familias de la tierra serían bendecidas. Abraham es un ejemplo de fe, porque obedeció a Dios sin saber exactamente a dónde iba.',
    questions: [
      const QuizQuestion(
        question: '¿Cómo se llamaba originalmente el hombre al que Dios llamó en Génesis 12?',
        options: [
          'A) Isaac',
          'B) Abram',
          'C) Jacob',
          'D) José'
        ],
        correctIndex: 1, // B
        hint: 'Es un nombre corto que Dios luego cambiaría por "Abraham".',
      ),
      const QuizQuestion(
        question: '¿Qué le pidió Dios a Abram que dejara atrás?',
        options: [
          'A) Solo su ropa',
          'B) Su tierra y su parentela (familia)',
          'C) Su fe',
          'D) Sus herramientas de trabajo'
        ],
        correctIndex: 1, // B
        hint: 'Dios le pidió que saliera de su zona de confort y de su hogar.',
      ),
      const QuizQuestion(
        question: '¿Sabía Abram exactamente a qué lugar lo llevaba Dios cuando salió?',
        options: [
          'A) Sí, tenía un mapa detallado',
          'B) No, Dios le dijo que Él se la mostraría después',
          'C) No, él se perdió en el camino',
          'D) Sí, él mismo eligió el país'
        ],
        correctIndex: 1, // B
        hint: 'La fe de Abram consistió en confiar aunque no conocía el destino final todavía.',
      ),
      const QuizQuestion(
        question: '¿Cuál de estas fue una de las promesas de Dios para Abram?',
        options: [
          'A) Que sería un gran guerrero',
          'B) Que haría de él una nación grande',
          'C) Que viviría para siempre en la tierra',
          'D) Que tendría mucho oro y plata'
        ],
        correctIndex: 1, // B
        hint: 'Dios prometió que sus descendientes serían muchísimos.',
      ),
      const QuizQuestion(
        question: '¿A qué edad salió Abram de Harán para seguir a Dios?',
        options: [
          'A) 12 años',
          'B) 25 años',
          'C) 75 años',
          'D) 100 años'
        ],
        correctIndex: 2, // C
        hint: 'Era un hombre de edad avanzada, lo cual hace su obediencia más impresionante.',
      ),
      const QuizQuestion(
        question: '¿Cómo se llamaba la esposa de Abram que lo acompañó?',
        options: [
          'A) Rebeca',
          'B) Raquel',
          'C) Sarai',
          'D) María'
        ],
        correctIndex: 2, // C
        hint: 'Su nombre también fue cambiado más tarde por Sara.',
      ),
      const QuizQuestion(
        question: '¿Qué virtud principal destaca en la vida de Abraham por haber obedecido a Dios?',
        options: [
          'A) La fuerza física',
          'B) La fe',
          'C) La riqueza',
          'D) La curiosidad'
        ],
        correctIndex: 1, // B
        hint: 'Se le conoce como el "Padre de la __".',
      ),
      const QuizQuestion(
        question: 'Según la promesa, ¿quiénes serían bendecidos a través de Abraham?',
        options: [
          'A) Solo sus vecinos',
          'B) Nadie más',
          'C) Todas las familias de la tierra',
          'D) Solo los reyes'
        ],
        correctIndex: 2, // C
        hint: 'La bendición de Dios tenía un alcance mundial.',
      ),
      const QuizQuestion(
        question: '¿A qué tierra llegaron finalmente Abram y su familia?',
        options: [
          'A) Egipto',
          'B) Babilonia',
          'C) Canaán',
          'D) Roma'
        ],
        correctIndex: 2, // C
        hint: 'Es la tierra que más tarde se conocería como la Tierra Prometida.',
      ),
      const QuizQuestion(
        question: '¿Qué construyó Abram en varios lugares para adorar a Dios durante su viaje?',
        options: [
          'A) Un palacio',
          'B) Un altar',
          'C) Una muralla',
          'D) Una escuela'
        ],
        correctIndex: 1, // B
        hint: 'Era un lugar de piedra para ofrecer sacrificios y dar gracias a Dios.',
      ),
    ],
  ),
  4: LessonData(
    id: 4,
    title: 'José, del Pozo al Palacio',
    biblicalReference: 'Génesis 37:3, 23-28; 41:39-40 (RVR1960)',
    biblicalText:
        '"Y amaba Israel a José más que a todos sus hijos... y le hizo una túnica de diversos colores. [...] Y sucedió que cuando llegó José a sus hermanos, ellos le quitaron su túnica... y le echaron en la cisterna. [...] Y cuando pasaban los mercaderes madianitas, sacaron ellos a José de la cisterna, y le vendieron a los ismaelitas por veinte piezas de plata. [...] Y dijo Faraón a José: ... tú estarás sobre mi casa, y por tu palabra se gobernará todo mi pueblo; solamente en el trono seré yo mayor que tú."',
    explanation:
        'La historia de José es una de las más completas sobre la soberanía de Dios. Comienza con el favoritismo de su padre (Jacob) y la envidia de sus hermanos, quienes lo venden como esclavo. José pasó por pruebas injustas: fue traicionado, acusado falsamente en la casa de Potifar y olvidado en la cárcel. Sin embargo, "Jehová estaba con José". Gracias a que Dios le dio el don de interpretar sueños, terminó siendo el segundo al mando de todo Egipto, salvando a su familia y a muchas naciones de una gran hambruna.',
    questions: [
      const QuizQuestion(
        question: '¿Por qué los hermanos de José le tenían envidia y no podían hablarle pacíficamente?',
        options: [
          'A) Porque José les robaba la comida',
          'B) Porque su padre lo amaba más y por sus sueños de grandeza',
          'C) Porque José era el hermano mayor',
          'D) Porque José no quería trabajar en el campo'
        ],
        correctIndex: 1, // B
        hint: 'El favoritismo de Jacob y los sueños donde sus hermanos se inclinaban ante él causaron el conflicto.',
      ),
      const QuizQuestion(
        question: '¿Qué hicieron sus hermanos con él antes de venderlo?',
        options: [
          'A) Lo escondieron en una cueva',
          'B) Lo echaron en una cisterna (pozo) vacía',
          'C) Lo enviaron de regreso con su padre',
          'D) Lo obligaron a pedir perdón'
        ],
        correctIndex: 1, // B
        hint: 'Fue un lugar profundo y seco donde lo dejaron mientras decidían qué hacer.',
      ),
      const QuizQuestion(
        question: '¿Por cuántas piezas de plata fue vendido José a los mercaderes?',
        options: [
          'A) 10 piezas',
          'B) 20 piezas',
          'C) 30 piezas',
          'D) 50 piezas'
        ],
        correctIndex: 1, // B
        hint: 'Es un número menor a las 30 monedas por las que fue traicionado Jesús.',
      ),
      const QuizQuestion(
        question: '¿Quién era el dueño de la casa en Egipto donde José trabajó primero y prosperó?',
        options: [
          'A) El Faraón',
          'B) Potifar, capitán de la guardia',
          'C) Un sacerdote egipcio',
          'D) Un pastor de ovejas'
        ],
        correctIndex: 1, // B
        hint: 'Era un oficial importante cuya esposa acusó a José falsamente.',
      ),
      const QuizQuestion(
        question: '¿Por qué terminó José en la cárcel en Egipto?',
        options: [
          'A) Por robar oro al Faraón',
          'B) Por intentar escapar a su tierra',
          'C) Por una acusación falsa de la esposa de Potifar',
          'D) Por no querer trabajar más'
        ],
        correctIndex: 2, // C
        hint: 'José prefirió ir a la cárcel antes que pecar contra Dios con la mujer de su amo.',
      ),
      const QuizQuestion(
        question: '¿Qué don especial usó José para ayudar al copero y al panadero en la prisión?',
        options: [
          'A) La fuerza para romper cadenas',
          'B) La interpretación de sueños',
          'C) La capacidad de cantar himnos',
          'D) El conocimiento de medicina'
        ],
        correctIndex: 1, // B
        hint: 'Dios le revelaba el significado de las imágenes que la gente veía al dormir.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el sueño del Faraón que José interpretó?',
        options: [
          'A) Siete estrellas y siete soles',
          'B) Siete vacas gordas y siete vacas flacas',
          'C) Un árbol gigante que caía',
          'D) Un barco hundiéndose en el Nilo'
        ],
        correctIndex: 1, // B
        hint: 'Las vacas flacas se comían a las gordas, representando el hambre que vendría.',
      ),
      const QuizQuestion(
        question: '¿Qué cargo le dio el Faraón a José después de interpretar su sueño?',
        options: [
          'A) Soldado raso',
          'B) Gobernador de todo Egipto (el segundo después del Faraón)',
          'C) Esclavo del palacio',
          'D) Sacerdote de los ídolos'
        ],
        correctIndex: 1, // B
        hint: 'Se convirtió en el administrador principal de todo el reino.',
      ),
      const QuizQuestion(
        question: '¿Cómo se comportó José cuando sus hermanos vinieron a Egipto por comida?',
        options: [
          'A) Se vengó de ellos metiéndolos a todos a la cárcel para siempre',
          'B) Los perdonó y les dijo que Dios usó el mal de ellos para bien',
          'C) Fingió que no los conocía y los echó del país',
          'D) Les pidió que le devolvieran el dinero de su venta'
        ],
        correctIndex: 1, // B
        hint: 'José entendió que Dios tenía un plan de salvación mayor que su dolor personal.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la gran lección de la vida de José (según Génesis 50:20)?',
        options: [
          'A) Que la túnica de colores da buena suerte',
          'B) Que lo que los hombres pensaron para mal, Dios lo encaminó a bien',
          'C) Que es mejor ser el hijo favorito',
          'D) Que Egipto es el mejor lugar para vivir'
        ],
        correctIndex: 1, // B
        hint: 'Dios puede transformar una tragedia en una gran victoria para muchos.',
      ),
    ],
  ),
  5: LessonData(
    id: 5,
    title: 'Moisés y la Libertad de Israel',
    biblicalReference: 'Éxodo 3:10; 12:31; 14:21-22 (RVR1960)',
    biblicalText:
        '"Ven, por tanto, ahora, y te enviaré a Faraón, para que saques de Egipto a mi pueblo... Y llamó a Moisés y a Aarón de noche, y dijo: Salid de en medio de mi pueblo... e id, servid a Jehová. [...] Y extendió Moisés su mano sobre el mar... e hizo Jehová que el mar se retirase por recio viento solano toda aquella noche; y volvió el mar en seco, y las aguas quedaron divididas. Entonces los hijos de Israel entraron por medio del mar, en seco, teniendo las aguas como muro a su derecha y a su izquierda."',
    explanation:
        'Moisés era un hebreo criado como príncipe en Egipto que huyó al desierto. Allí, Dios se le apareció en una zarza ardiente y lo envió de regreso para liberar a Su pueblo de la esclavitud. Después de que Dios enviara diez plagas sobre Egipto porque el Faraón se negaba a dejarlos ir, finalmente el pueblo salió. El momento más asombroso ocurrió cuando quedaron atrapados entre el ejército egipcio y el Mar Rojo; Dios dividió las aguas para que cruzaran por tierra seca, demostrando que Él es el Libertador todopoderoso.',
    questions: [
      const QuizQuestion(
        question: '¿En qué forma se le apareció Dios a Moisés por primera vez para llamarlo?',
        options: [
          'A) En un sueño profundo',
          'B) En una zarza (arbusto) que ardía y no se consumía',
          'C) A través de un ángel en el palacio',
          'D) En una nube de lluvia'
        ],
        correctIndex: 1, // B
        hint: 'Fue un fuego que no quemaba las hojas de la planta.',
      ),
      const QuizQuestion(
        question: '¿Cuál era la misión principal que Dios le encomendó a Moisés?',
        options: [
          'A) Ser el nuevo Faraón de Egipto',
          'B) Sacar al pueblo de Israel de la esclavitud en Egipto',
          'C) Construir un templo en el desierto',
          'D) Organizar un ejército para pelear contra Roma'
        ],
        correctIndex: 1, // B
        hint: 'Su objetivo era la libertad de los hebreos.',
      ),
      const QuizQuestion(
        question: '¿Cómo se llamaba el hermano de Moisés que le ayudó a hablar ante el Faraón?',
        options: [
          'A) José',
          'B) Josué',
          'C) Aarón',
          'D) Caleb'
        ],
        correctIndex: 2, // C
        hint: 'Fue el primer Sumo Sacerdote de Israel.',
      ),
      const QuizQuestion(
        question: '¿Cuántas plagas envió Dios sobre Egipto antes de que el Faraón los dejara ir?',
        options: [
          'A) 3 plagas',
          'B) 7 plagas',
          'C) 10 plagas',
          'D) 12 plagas'
        ],
        correctIndex: 2, // C
        hint: 'Es el mismo número que el de los Mandamientos.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la última plaga, que finalmente convenció al Faraón de dejar salir al pueblo?',
        options: [
          'A) Las ranas',
          'B) La muerte de los primogénitos (hijos mayores)',
          'C) El agua convertida en sangre',
          'D) Las langostas'
        ],
        correctIndex: 1, // B
        hint: 'Fue el juicio más severo sobre las familias de Egipto.',
      ),
      const QuizQuestion(
        question: '¿Qué obstáculo natural detuvo al pueblo de Israel justo después de salir de Egipto?',
        options: [
          'A) El Río Jordán',
          'B) El Mar Rojo',
          'C) Una montaña de fuego',
          'D) Un desierto de sal'
        ],
        correctIndex: 1, // B
        hint: 'Una gran masa de agua que parecía imposible de cruzar sin barcos.',
      ),
      const QuizQuestion(
        question: '¿Qué hizo Dios para que el pueblo pudiera cruzar el Mar Rojo?',
        options: [
          'A) Hizo aparecer un puente de piedra',
          'B) Dividió las aguas con un viento fuerte para que pasaran en seco',
          'C) Hizo que todos los israelitas pudieran volar',
          'D) Congeló el agua para que caminaran sobre el hielo'
        ],
        correctIndex: 1, // B
        hint: 'Las aguas formaron muros a los lados del camino.',
      ),
      const QuizQuestion(
        question: '¿Qué objeto extendió Moisés sobre el mar para que este se dividiera?',
        options: [
          'A) Su capa',
          'B) Una espada de oro',
          'C) Su vara',
          'D) Un libro'
        ],
        correctIndex: 2, // C
        hint: 'La misma vara de madera que usaba como pastor.',
      ),
      const QuizQuestion(
        question: '¿Qué pasó con el ejército del Faraón que perseguía a los israelitas?',
        options: [
          'A) Se dieron la vuelta y regresaron',
          'B) Se perdieron en el desierto',
          'C) Las aguas volvieron a su lugar y los cubrieron',
          'D) Se unieron al pueblo de Israel'
        ],
        correctIndex: 2, // C
        hint: 'El mar se cerró sobre ellos cuando intentaron cruzar.',
      ),
      const QuizQuestion(
        question: '¿Cómo guiaba Dios al pueblo durante su camino por el desierto?',
        options: [
          'A) Con una columna de nube de día y de fuego de noche',
          'B) Con un mapa grabado en piedra',
          'C) Con mensajeros a caballo',
          'D) Solo por la posición de las estrellas'
        ],
        correctIndex: 0, // A
        hint: 'Eran señales visibles de Su presencia constante.',
      ),
    ],
  ),
  6: LessonData(
    id: 6,
    title: 'Los Diez Mandamientos y el Pacto',
    biblicalReference: 'Éxodo 19:16; 20:1-3, 12, 15-17 (RVR1960)',
    biblicalText:
        '"Aconteció que al tercer día, al venir la mañana, vinieron truenos y relámpagos, y espesa nube sobre el monte... y todo el pueblo que estaba en el campamento se estremeció. [...] Y habló Dios todas estas palabras, diciendo: Yo soy Jehová tu Dios... No tendrás dioses ajenos delante de mí. [...] Honra a tu padre y a tu madre... No matarás. No cometerás adulterio. No hurtarás. No hablarás contra tu prójimo falso testimonio. No codiciarás la casa de tu prójimo..."',
    explanation:
        'Después de ser liberados de Egipto, Dios llevó al pueblo al pie del Monte Sinaí. Allí, entre truenos y fuego, Dios les entregó Su Ley. No eran solo reglas para prohibir cosas, sino una guía para que el pueblo pudiera vivir en paz, respetando a Dios y a los demás. Los mandamientos se dividen en dos partes: los primeros cuatro tratan sobre nuestra relación con Dios, y los otros seis sobre nuestra relación con el prójimo (las personas que nos rodean). Dios mismo escribió estas palabras en dos tablas de piedra.',
    questions: [
      const QuizQuestion(
        question: '¿En qué lugar específico entregó Dios los Diez Mandamientos a Moisés?',
        options: [
          'A) En las orillas del Mar Rojo',
          'B) En la cima del Monte Sinaí',
          'C) Dentro del Arca de Noé',
          'D) En el palacio del Faraón'
        ],
        correctIndex: 1, // B
        hint: 'Es una montaña sagrada donde hubo fuego y nubes espesas.',
      ),
      const QuizQuestion(
        question: '¿Qué fenómenos naturales acompañaron la presencia de Dios en el monte?',
        options: [
          'A) Un sol brillante y arcoíris',
          'B) Truenos, relámpagos y una espesa nube',
          'C) Una lluvia de granizo y nieve',
          'D) El monte se convirtió en agua'
        ],
        correctIndex: 1, // B
        hint: 'Fue un momento imponente que hizo que todo el pueblo temblara de temor.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el primer mandamiento que Dios menciona?',
        options: [
          'A) No robarás a nadie',
          'B) No tendrás dioses ajenos delante de mí',
          'C) Descansarás el día sábado',
          'D) No dirás mentiras'
        ],
        correctIndex: 1, // B
        hint: 'Se trata de poner a Dios en el primer lugar de nuestra vida.',
      ),
      const QuizQuestion(
        question: '¿Qué material usó Dios para entregar los mandamientos de forma permanente?',
        options: [
          'A) Rollos de papel papiro',
          'B) Tablas de madera de cedro',
          'C) Tablas de piedra escritas por el dedo de Dios',
          'D) Placas de oro puro'
        ],
        correctIndex: 2, // C
        hint: 'Era un material sólido que representaba la firmeza de la Ley.',
      ),
      const QuizQuestion(
        question: '¿Qué significa el mandamiento "Honra a tu padre y a tu madre"?',
        options: [
          'A) Obedecerlos solo cuando te dan regalos',
          'B) Respetarlos, amarlos y cuidarlos',
          'C) Vivir siempre en su casa',
          'D) Darles todo tu dinero'
        ],
        correctIndex: 1, // B
        hint: 'Es un mandamiento de respeto hacia quienes te dieron la vida.',
      ),
      const QuizQuestion(
        question: '¿Qué mandamiento prohíbe tomar cosas que no te pertenecen?',
        options: [
          'A) No matarás',
          'B) No hurtarás (no robarás)',
          'C) No codiciarás',
          'D) No hablarás falso testimonio'
        ],
        correctIndex: 1, // B
        hint: 'Se refiere a respetar la propiedad de los demás.',
      ),
      const QuizQuestion(
        question: '¿Qué significa "No hablarás falso testimonio"?',
        options: [
          'A) No hablar muy fuerte',
          'B) No decir mentiras ni chismes contra otros',
          'C) No hablar con desconocidos',
          'D) No cantar canciones tristes'
        ],
        correctIndex: 1, // B
        hint: 'Tiene que ver con la honestidad y no engañar a los demás.',
      ),
      const QuizQuestion(
        question: '¿Qué mandamiento nos pide no desear con envidia lo que otros tienen?',
        options: [
          'A) No matarás',
          'B) No tendrás otros dioses',
          'C) No codiciarás',
          'D) Honra a tus padres'
        ],
        correctIndex: 2, // C
        hint: '"Codiciar" es querer egoístamente lo ajeno (casa, bienes, familia de otro).',
      ),
      const QuizQuestion(
        question: '¿Cuántos días estuvo Moisés en el monte hablando con Dios?',
        options: [
          'A) 7 días',
          'B) 12 días',
          'C) 40 días y 40 noches',
          'D) 100 días'
        ],
        correctIndex: 2, // C
        hint: 'Es un número muy común en la Biblia para periodos de prueba o preparación.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito principal de estos mandamientos según la Biblia?',
        options: [
          'A) Hacer que la vida sea aburrida',
          'B) Enseñarnos a amar a Dios y a nuestro prójimo',
          'C) Castigar a todos los que se equivoquen',
          'D) Que solo los reyes los cumplan'
        ],
        correctIndex: 1, // B
        hint: 'Jesús resumió toda la ley en dos: amar a Dios y amar a los demás.',
      ),
    ],
  ),
  7: LessonData(
    id: 7,
    title: 'La Caída de los Muros de Jericó',
    biblicalReference: 'Josué 2:1, 18; 6:2-5, 20 (RVR1960)',
    biblicalText:
        '"Jehová dijo a Josué: Mira, yo he entregado en tu mano a Jericó... Rodearéis la ciudad todos los hombres de guerra una vez al día por seis días. [...] Y al séptimo día daréis siete vueltas... y el muro de la ciudad caerá. [...] Mas la mujer llamada Rahab había escondido a los espías de Israel... y ellos le dijeron: Ata este cordón de grana (rojo) a la ventana por donde nos descolgaste, y reunirás en tu casa a tu padre y a tu madre... para que no mueran. [...] El pueblo gritó, y el muro se derrumbó."',
    explanation:
        'Jericó era una ciudad con murallas inmensas que la hacían parecer impenetrable. Dios le dio a Josué una estrategia inusual: marchar en silencio alrededor de la ciudad durante seis días, y el séptimo día dar siete vueltas, tocar las trompetas y gritar. Antes del ataque, unos espías de Israel entraron a la ciudad y fueron protegidos por una mujer llamada Rahab. Por su fe y ayuda, ella y su familia fueron los únicos sobrevivientes de Jericó cuando los muros cayeron por el poder de Dios.',
    questions: [
      const QuizQuestion(
        question: '¿Quién fue el líder que guio al pueblo de Israel después de la muerte de Moisés?',
        options: [
          'A) David',
          'B) Josué',
          'C) Aarón',
          'D) Gedeón'
        ],
        correctIndex: 1, // B
        hint: 'Fue un guerrero valiente que antes fue ayudante de Moisés.',
      ),
      const QuizQuestion(
        question: '¿Cómo estaban las puertas de Jericó cuando llegó el pueblo de Israel?',
        options: [
          'A) Abiertas para recibirlos',
          'B) Cerradas, nadie entraba ni salía por miedo',
          'C) No tenían puertas',
          'D) Estaban hechas de cristal'
        ],
        correctIndex: 1, // B
        hint: 'La ciudad estaba "bien cerrada" para protegerse del ataque.',
      ),
      const QuizQuestion(
        question: '¿Cuántas vueltas debían dar a la ciudad cada día durante los primeros seis días?',
        options: [
          'A) Siete vueltas',
          'B) Una vuelta',
          'C) Tres vueltas',
          'D) Ninguna, debían esperar sentados'
        ],
        correctIndex: 1, // B
        hint: 'Era una caminata diaria en total silencio.',
      ),
      const QuizQuestion(
        question: '¿Qué debían llevar los sacerdotes delante del Arca del Pacto?',
        options: [
          'A) Espadas de oro',
          'B) Siete bocinas (trompetas) de cuerno de carnero',
          'C) Antorchas encendidas',
          'D) Banderas blancas'
        ],
        correctIndex: 1, // B
        hint: 'Son instrumentos de viento que hacen un sonido fuerte.',
      ),
      const QuizQuestion(
        question: '¿Qué cambio hubo en la rutina el séptimo día?',
        options: [
          'A) No salieron del campamento',
          'B) Rodearon la ciudad siete veces',
          'C) Solo rodearon la mitad de la ciudad',
          'D) Atacaron con flechas desde lejos'
        ],
        correctIndex: 1, // B
        hint: 'El número siete es muy importante en esta instrucción de Dios.',
      ),
      const QuizQuestion(
        question: '¿Cómo debía estar el pueblo mientras caminaba alrededor de los muros?',
        options: [
          'A) Cantando muy fuerte',
          'B) En absoluto silencio, sin decir ni una palabra',
          'C) Discutiendo la estrategia',
          'D) Llorando de miedo'
        ],
        correctIndex: 1, // B
        hint: 'Josué les ordenó no gritar hasta que él diera la señal el último día.',
      ),
      const QuizQuestion(
        question: '¿Qué debía hacer el pueblo cuando escuchara el sonido largo de las trompetas el séptimo día?',
        options: [
          'A) Correr hacia atrás',
          'B) Sentarse a descansar',
          'C) Gritar a gran voz',
          'D) Empezar a construir escaleras'
        ],
        correctIndex: 2, // C
        hint: 'Fue un grito de victoria que activó el poder de Dios.',
      ),
      const QuizQuestion(
        question: '¿Qué les sucedió a las murallas de Jericó al final del relato?',
        options: [
          'A) Se quemaron con fuego del cielo',
          'B) Se derrumbaron por completo',
          'C) Se abrieron las puertas solas',
          'D) Fueron destruidas por un terremoto natural'
        ],
        correctIndex: 1, // B
        hint: 'El texto dice que el muro "se derrumbó" tras el grito del pueblo.',
      ),
      const QuizQuestion(
        question: '¿Quién le dio la estrategia de batalla a Josué?',
        options: [
          'A) Sus generales de guerra',
          'B) El Faraón de Egipto',
          'C) Dios (Jehová)',
          'D) Los espías que envió a la ciudad'
        ],
        correctIndex: 2, // C
        hint: 'Fue una instrucción divina que no parecía tener lógica humana.',
      ),
      const QuizQuestion(
        question: '¿Qué mujer de Jericó y su familia fueron salvados por haber ayudado a los espías de Israel?',
        options: [
          'A) María',
          'B) Débora',
          'C) Rahab',
          'D) Rut'
        ],
        correctIndex: 2, // C
        hint: 'Ella puso un cordón rojo en su ventana para que su casa no fuera destruida.',
      ),
    ],
  ),
  8: LessonData(
    id: 8,
    title: 'David y el Gigante Goliat',
    biblicalReference: '1 Samuel 17:4, 33, 40, 45, 49-50 (RVR1960)',
    biblicalText:
        '"Salió entonces del campamento de los filisteos un paladín que se llamaba Goliat, de Gat, y tenía de altura seis codos y un palmo. [...] Dijo Saúl a David: No podrás tú ir contra aquel filisteo... porque tú eres muchacho. [...] Y tomó David su cayado en su mano, y escogió cinco piedras lisas del arroyo, y las puso en el saco pastoril... y tomó su honda en su mano. [...] Entonces dijo David al filisteo: Tú vienes a mí con espada y lanza y jabalina; mas yo vengo a ti en el nombre de Jehová de los ejércitos. [...] Y metiendo David su mano en la bolsa, tomó de allí una piedra, y la tiró con la honda, e hirió al filisteo en la frente; y la piedra quedó clavada en la frente, y cayó sobre su rostro en tierra."',
    explanation:
        'Israel estaba en guerra contra los filisteos. El enemigo tenía un guerrero gigante llamado Goliat que asustaba a todo el ejército del Rey Saúl. David, un joven pastor que solo había ido al campamento a llevar comida a sus hermanos, se ofreció a pelear. No usó armadura ni espada, sino su confianza en Dios y una honda de pastor. David demostró que no importa cuán grande sea el problema (el gigante), con la ayuda de Dios y la fe, se puede obtener la victoria.',
    questions: [
      const QuizQuestion(
        question: '¿A qué pueblo pertenecía el gigante Goliat?',
        options: [
          'A) A los egipcios',
          'B) A los filisteos',
          'C) A los asirios',
          'D) A los babilonios'
        ],
        correctIndex: 1, // B
        hint: 'Eran los enemigos constantes de Israel en ese tiempo.',
      ),
      const QuizQuestion(
        question: '¿Cuál era el oficio principal de David antes de ir a la batalla?',
        options: [
          'A) Carpintero',
          'B) Soldado profesional',
          'C) Pastor de ovejas',
          'D) Pescador'
        ],
        correctIndex: 2, // C
        hint: 'Él cuidaba los animales de su padre Isaí.',
      ),
      const QuizQuestion(
        question: '¿Qué le dijo el Rey Saúl a David cuando este se ofreció a pelear?',
        options: [
          'A) "Eres el más valiente de todos"',
          'B) "No podrás ir, porque eres solo un muchacho"',
          'C) "Toma mi caballo y huye"',
          'D) "Te daré todo mi oro si ganas"'
        ],
        correctIndex: 1, // B
        hint: 'Saúl dudaba de David por su juventud y falta de experiencia militar.',
      ),
      const QuizQuestion(
        question: '¿Por qué David no usó la armadura y el casco de bronce que Saúl le prestó?',
        options: [
          'A) Porque eran muy feos',
          'B) Porque nunca los había practicado y no podía caminar bien',
          'C) Porque eran de madera',
          'D) Porque se los robaron antes de la pelea'
        ],
        correctIndex: 1, // B
        hint: 'David prefirió usar lo que ya conocía: sus herramientas de pastor.',
      ),
      const QuizQuestion(
        question: '¿Cuántas piedras escogió David del arroyo para su honda?',
        options: [
          'A) Una sola',
          'B) Doce piedras',
          'C) Cinco piedras lisas',
          'D) Siete piedras'
        ],
        correctIndex: 2, // C
        hint: 'Aunque solo necesitó una, se preparó con cinco.',
      ),
      const QuizQuestion(
        question: '¿Qué arma utilizó David para lanzar la piedra contra el gigante?',
        options: [
          'A) Un arco y flecha',
          'B) Una ballesta',
          'C) Una honda',
          'D) Una lanza larga'
        ],
        correctIndex: 2, // C
        hint: 'Es un instrumento de cuero que los pastores usaban para espantar lobos.',
      ),
      const QuizQuestion(
        question: '¿En nombre de quién dijo David que venía a pelear contra Goliat?',
        options: [
          'A) En su propio nombre',
          'B) En el nombre del Rey Saúl',
          'C) En el nombre de Jehová de los ejércitos',
          'D) En el nombre de sus hermanos mayores'
        ],
        correctIndex: 2, // C
        hint: 'David sabía que la fuerza humana no era suficiente, necesitaba el poder de Dios.',
      ),
      const QuizQuestion(
        question: '¿En qué parte del cuerpo golpeó la piedra a Goliat?',
        options: [
          'A) En el corazón',
          'B) En el brazo derecho',
          'C) En la frente',
          'D) En la rodilla'
        ],
        correctIndex: 2, // C
        hint: 'Fue el único lugar donde la armadura del gigante no lo protegía.',
      ),
      const QuizQuestion(
        question: '¿Qué armas traía Goliat para pelear (según el versículo 45)?',
        options: [
          'A) Solo un escudo',
          'B) Espada, lanza y jabalina',
          'C) Un hacha de guerra',
          'D) Piedras de gran tamaño'
        ],
        correctIndex: 1, // B
        hint: 'Eran armas de metal pesadas y muy peligrosas.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el resultado final de la batalla?',
        options: [
          'A) David huyó asustado',
          'B) Goliat pidió perdón',
          'C) David venció al gigante y este cayó en tierra',
          'D) Quedaron en un empate'
        ],
        correctIndex: 2, // C
        hint: 'Dios le dio la victoria al joven pastor sobre el guerrero experimentado.',
      ),
    ],
  ),
  9: LessonData(
    id: 9,
    title: 'Salomón y el Regalo de la Sabiduría',
    biblicalReference: '1 Reyes 3:5, 9-12 (RVR1960)',
    biblicalText:
        '"Y se le apareció Jehová a Salomón en Gabaón una noche en sueños, y le dijo Dios: Pide lo que quieras que yo te dé. [...] Y Salomón dijo: Da, pues, a tu siervo corazón entendido para juzgar a tu pueblo, y para discernir entre lo bueno y lo malo... Y agradó a delante del Señor que Salomón pidiese esto. [...] Y le dijo Dios: Por cuanto has pedido esto, y no pediste para ti muchos días, ni pediste para ti riquezas... he aquí lo he hecho conforme a tus palabras; he aquí que te he dado corazón sabio y entendido."',
    explanation:
        'Cuando Salomón se convirtió en rey después de su padre David, se sintió muy joven para una responsabilidad tan grande. Una noche, Dios le dio la oportunidad de pedir cualquier deseo. En lugar de pedir dinero, poder o fama, Salomón pidió sabiduría para poder gobernar bien al pueblo de Israel. A Dios le agradó tanto que Salomón no fuera egoísta, que no solo le dio la sabiduría más grande de la historia, sino que también lo bendijo con riquezas y mucha paz durante su reinado.',
    questions: [
      const QuizQuestion(
        question: '¿Quién fue el padre del Rey Salomón?',
        options: [
          'A) Saúl',
          'B) David',
          'C) Moisés',
          'D) Samuel'
        ],
        correctIndex: 1, // B
        hint: 'Fue el rey que antes de gobernar venció a un gigante con una honda.',
      ),
      const QuizQuestion(
        question: '¿En qué momento se le apareció Dios a Salomón para ofrecerle un regalo?',
        options: [
          'A) Mientras comía en un banquete',
          'B) Durante una batalla',
          'C) En un sueño durante la noche',
          'D) Mientras caminaba por el bosque'
        ],
        correctIndex: 2, // C
        hint: 'Dios le habló mientras Salomón descansaba en Gabaón.',
      ),
      const QuizQuestion(
        question: '¿Qué le dijo Dios a Salomón específicamente?',
        options: [
          'A) "Te daré todo el oro del mundo"',
          'B) "Pide lo que quieras que yo te dé"',
          'C) "Debes construirme un palacio ahora"',
          'D) "Tus enemigos serán derrotados"'
        ],
        correctIndex: 1, // B
        hint: 'Fue una pregunta abierta para probar el corazón del joven rey.',
      ),
      const QuizQuestion(
        question: '¿Qué fue lo que Salomón le pidió a Dios en lugar de riquezas?',
        options: [
          'A) Larga vida para vivir siempre',
          'B) Sabiduría y un corazón entendido para juzgar al pueblo',
          'C) Un ejército más grande que el de su padre',
          'D) Viajar por todo el mundo'
        ],
        correctIndex: 1, // B
        hint: 'Pidió algo que le ayudara a servir mejor a los demás, no a sí mismo.',
      ),
      const QuizQuestion(
        question: '¿Qué significa "discernir entre lo bueno y lo malo" en este contexto?',
        options: [
          'A) Saber qué comida es mejor',
          'B) Tener la capacidad de tomar decisiones correctas y justas',
          'C) Conocer todos los idiomas del mundo',
          'D) Ser el hombre más fuerte'
        ],
        correctIndex: 1, // B
        hint: 'Es la habilidad de ver la verdad en situaciones difíciles.',
      ),
      const QuizQuestion(
        question: '¿Cómo se sintió Dios con la petición de Salomón?',
        options: [
          'A) Se enojó porque no pidió dinero',
          'B) No le prestó atención',
          'C) Se agradó mucho porque Salomón no fue egoísta',
          'D) Le dijo que pidiera otra cosa'
        ],
        correctIndex: 2, // C
        hint: 'El texto dice: "y agradó delante del Señor que Salomón pidiese esto".',
      ),
      const QuizQuestion(
        question: '¿Qué cosas NO pidió Salomón, aunque podía haberlo hecho?',
        options: [
          'A) Sabiduría y paz',
          'B) Riquezas, larga vida y la muerte de sus enemigos',
          'C) El bienestar del pueblo de Israel',
          'D) La ayuda de Dios'
        ],
        correctIndex: 1, // B
        hint: 'Dios mencionó estas tres cosas que la mayoría de los reyes habrían pedido primero.',
      ),
      const QuizQuestion(
        question: '¿Qué recibió Salomón además de la sabiduría que pidió?',
        options: [
          'A) Nada más, solo lo que pidió',
          'B) Riquezas y gloria (honor) como ningún otro rey',
          'C) Problemas con sus vecinos',
          'D) Una armadura de oro mágico'
        ],
        correctIndex: 1, // B
        hint: 'Por haber buscado primero lo correcto, Dios le dio "añadidura" de bendiciones materiales.',
      ),
      const QuizQuestion(
        question: '¿Qué famoso edificio construyó Salomón para Dios en Jerusalén?',
        options: [
          'A) Una pirámide gigante',
          'B) El Templo de Jerusalén',
          'C) Una muralla de cristal',
          'D) Una biblioteca nacional'
        ],
        correctIndex: 1, // B
        hint: 'Fue el lugar principal de adoración para todo Israel.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el mensaje principal de esta lección?',
        options: [
          'A) Que es malo tener dinero',
          'B) Que la sabiduría de Dios es más valiosa que las riquezas materiales',
          'C) Que los sueños no significan nada',
          'D) Que Salomón era mejor que su padre David'
        ],
        correctIndex: 1, // B
        hint: 'Nos enseña a pedir a Dios cosas que nos ayuden a ser mejores personas y servidores.',
      ),
    ],
  ),
  10: LessonData(
    id: 10,
    title: 'Daniel y el Foso de los Leones',
    biblicalReference: 'Daniel 6:10, 16, 21-22 (RVR1960)',
    biblicalText:
        '"Cuando Daniel supo que el edicto había sido firmado... se arrodillaba tres veces al día, y oraba y daba gracias delante de su Dios, como lo solía hacer antes. [...] Entonces el rey mandó, y trajeron a Daniel, y le echaron en el foso de los leones. [...] Entonces Daniel respondió al rey: Oh rey, vive para siempre. Mi Dios envió su ángel, el cual cerró la boca de los leones, para que no me hiciesen daño, porque ante él fui hallado inocente."',
    explanation:
        'Daniel era un hombre sabio que servía en el reino de Babilonia y Persia. Otros gobernantes, por envidia, engañaron al Rey Darío para que firmara una ley que prohibía orar a cualquier dios que no fuera el rey. Daniel, aunque sabía que corría peligro, decidió seguir siendo fiel a Dios y orar tres veces al día. Por su desobediencia a la ley de los hombres, fue lanzado a un foso con leones hambrientos. Sin embargo, Dios protegió a Daniel enviando un ángel que mantuvo a los leones bajo control, demostrando que Dios cuida a quienes le son fieles.',
    questions: [
      const QuizQuestion(
        question: '¿Cuál era la costumbre de Daniel respecto a la oración?',
        options: [
          'A) Oraba una vez a la semana',
          'B) Oraba tres veces al día',
          'C) Solo oraba cuando tenía problemas',
          'D) Nunca oraba en público'
        ],
        correctIndex: 1, // B
        hint: 'Lo hacía por la mañana, tarde y noche con las ventanas abiertas hacia Jerusalén.',
      ),
      const QuizQuestion(
        question: '¿Por qué los otros gobernantes querían castigar a Daniel?',
        options: [
          'A) Porque Daniel les había robado',
          'B) Porque tenían envidia de su sabiduría y su puesto',
          'C) Porque Daniel era un mal trabajador',
          'D) Porque no conocían a Daniel'
        ],
        correctIndex: 1, // B
        hint: 'Daniel era tan íntegro que no hallaban ninguna falta en él, excepto en su fe.',
      ),
      const QuizQuestion(
        question: '¿Qué decía la ley (edicto) que el Rey Darío firmó bajo engaño?',
        options: [
          'A) Que todos debían dar dinero al rey',
          'B) Que nadie podía orar a ningún dios u hombre excepto al rey por 30 días',
          'C) Que Daniel debía ser nombrado rey',
          'D) Que todos debían irse de Babilonia'
        ],
        correctIndex: 1, // B
        hint: 'Fue una ley diseñada específicamente para atrapar a Daniel en su fe.',
      ),
      const QuizQuestion(
        question: '¿Qué hizo Daniel cuando supo que la ley prohibía orar a Dios?',
        options: [
          'A) Dejó de orar por un mes',
          'B) Se escondió en un sótano para que no lo vieran',
          'C) Siguió orando a Dios como siempre lo hacía',
          'D) Se fue del país inmediatamente'
        ],
        correctIndex: 2, // C
        hint: 'Su fidelidad a Dios era más importante que cualquier ley humana.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el castigo que recibió Daniel por seguir orando a Dios?',
        options: [
          'A) Fue enviado a la cárcel común',
          'B) Fue lanzado a un foso lleno de leones',
          'C) Fue expulsado del reino',
          'D) Tuvo que pagar una multa muy cara'
        ],
        correctIndex: 1, // B
        hint: 'Fue puesto en un lugar con animales muy peligrosos y hambrientos.',
      ),
      const QuizQuestion(
        question: '¿Cómo se sentía el Rey Darío después de echar a Daniel al foso?',
        options: [
          'A) Estaba muy feliz por su victoria',
          'B) Estaba muy triste y no pudo dormir ni comer esa noche',
          'C) Le daba igual lo que pasara',
          'D) Se olvidó de Daniel rápidamente'
        ],
        correctIndex: 1, // B
        hint: 'El rey apreciaba mucho a Daniel y se dio cuenta de que lo habían engañado.',
      ),
      const QuizQuestion(
        question: '¿Quién protegió a Daniel dentro del foso con los leones?',
        options: [
          'A) Un soldado que entró con él',
          'B) Un ángel enviado por Dios',
          'C) Los leones no tenían hambre',
          'D) Daniel era muy fuerte y luchó con ellos'
        ],
        correctIndex: 1, // B
        hint: 'Fue una intervención milagrosa del cielo.',
      ),
      const QuizQuestion(
        question: '¿Qué les pasó a los leones cuando Daniel estuvo con ellos?',
        options: [
          'A) Se durmieron por el frío',
          'B) Dios cerró sus bocas y no le hicieron daño',
          'C) Se escaparon del foso',
          'D) Daniel los domesticó con comida'
        ],
        correctIndex: 1, // B
        hint: 'Los leones estaban allí, pero no pudieron morderlo.',
      ),
      const QuizQuestion(
        question: '¿Qué hizo el rey a la mañana siguiente muy temprano?',
        options: [
          'A) Hizo una fiesta para celebrar',
          'B) Fue al foso y llamó a Daniel con voz triste para ver si estaba vivo',
          'C) Nombró a otro gobernador en lugar de Daniel',
          'D) Se fue de viaje a otra ciudad'
        ],
        correctIndex: 1, // B
        hint: 'Tenía la esperanza de que el Dios de Daniel lo hubiera salvado.',
      ),
      const QuizQuestion(
        question: '¿Qué decreto dio el rey después de ver que Daniel estaba a salvo?',
        options: [
          'A) Que nadie hablara de lo sucedido',
          'B) Que todos en su reino debían temer y respetar al Dios vivo de Daniel',
          'C) Que los leones debían ser liberados',
          'D) Que Daniel debía jubilarse'
        ],
        correctIndex: 1, // B
        hint: 'El milagro hizo que un rey pagano reconociera el poder del único Dios verdadero.',
      ),
    ],
  ),
};
