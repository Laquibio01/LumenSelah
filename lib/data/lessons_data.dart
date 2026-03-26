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
  11: LessonData(
    id: 11,
    title: 'El Sermón del Monte y las Bienaventuranzas',
    biblicalReference: 'Mateo 5:1-10 (RVR1960)',
    biblicalText:
        '"Viendo la multitud, subió al monte; y sentándose, vinieron a él sus discípulos. Y abriendo su boca les enseñaba, diciendo: Bienaventurados los pobres en espíritu, porque de ellos es el reino de los cielos. Bienaventurados los que lloran, porque ellos recibirán consolación. Bienaventurados los mansos, porque ellos recibirán la tierra por heredad. Bienaventurados los que tienen hambre y sed de justicia, porque ellos serán saciados. Bienaventurados los misericordiosos, porque ellos alcanzarán misericordia. Bienaventurados los de limpio corazón, porque ellos verán a Dios. Bienaventurados los pacificadores, porque ellos serán llamados hijos de Dios. Bienaventurados los que padecen persecución por causa de la justicia, porque de ellos es el reino de los cielos."',
    explanation:
        'El Sermón del Monte es la enseñanza más famosa de Jesús. En las "Bienaventuranzas", Jesús redefine lo que significa ser bendecido. Mientras el mundo valora la riqueza y el poder, Jesús enseña que el Reino de Dios pertenece a los humildes, a los que buscan la paz y a los que tienen un corazón puro. La palabra "Bienaventurado" significa "doblemente dichoso" o "plenamente feliz", pero no por las circunstancias externas, sino por una condición interna que Dios otorga.',
    questions: [
      const QuizQuestion(
        question: '¿Qué significa el término "Bienaventurado" en su raíz original?',
        options: ['A) Rico', 'B) Plenamente feliz/Dichoso', 'C) Suertudo', 'D) Fuerte'],
        correctIndex: 1, // B
        hint: 'Es una felicidad profunda que viene de Dios.',
      ),
      const QuizQuestion(
        question: '¿A quiénes pertenece el "reino de los cielos" según la primera bienaventuranza?',
        options: ['A) A los reyes', 'B) A los pobres en espíritu', 'C) A los que tienen mucho dinero', 'D) A los sabios'],
        correctIndex: 1, // B
        hint: 'Se refiere a los que reconocen su necesidad espiritual ante Dios.',
      ),
      const QuizQuestion(
        question: '¿Qué promesa reciben los que tienen "limpio corazón"?',
        options: ['A) Verán a Dios', 'B) Serán reyes', 'C) Tendrán larga vida', 'D) Serán famosos'],
        correctIndex: 0, // A
        hint: 'La pureza interna permite la comunión directa con el Creador.',
      ),
      const QuizQuestion(
        question: '¿Cómo serán llamados los "pacificadores" (los que buscan la paz)?',
        options: ['A) Ángeles', 'B) Jueces', 'C) Hijos de Dios', 'D) Buenos ciudadanos'],
        correctIndex: 2, // C
        hint: 'Reflejan el carácter de Dios, quien es el Dios de paz.',
      ),
      const QuizQuestion(
        question: '¿Qué recibirán los "mansos" como herencia?',
        options: ['A) El cielo', 'B) Oro y plata', 'C) La tierra', 'D) Una corona'],
        correctIndex: 2, // C
        hint: 'La mansedumbre no es debilidad, sino fuerza bajo control que hereda el mundo.',
      ),
      const QuizQuestion(
        question: 'Según el texto, ¿qué recibirán los que "lloran"?',
        options: ['A) Tristeza eterna', 'B) Consolación', 'C) Dinero', 'D) Olvido'],
        correctIndex: 1, // B
        hint: 'Dios promete consuelo a quienes sufren con esperanza.',
      ),
      const QuizQuestion(
        question: '¿Qué caracteriza a los que tienen "hambre y sed de justicia"?',
        options: ['A) Que quieren vengarse', 'B) Que serán saciados', 'C) Que nunca comerán', 'D) Que son jueces'],
        correctIndex: 1, // B
        hint: 'Dios promete llenar ese anhelo de ver lo recto cumplido.',
      ),
      const QuizQuestion(
        question: '¿Por qué causa deben padecer persecución para recibir el reino?',
        options: ['A) Por ser rebeldes', 'B) Por causa de la justicia', 'C) Por sus errores', 'D) Por ser políticos'],
        correctIndex: 1, // B
        hint: 'El mundo a veces rechaza lo que es justo.',
      ),
      const QuizQuestion(
        question: '¿Qué alcanzan los "misericordiosos"?',
        options: ['A) Fama', 'B) Justicia dura', 'C) Misericordia', 'D) Poder'],
        correctIndex: 2, // C
        hint: 'Recibimos de Dios lo mismo que damos a los demás.',
      ),
      const QuizQuestion(
        question: '¿Dónde se encontraba Jesús cuando dio estas enseñanzas?',
        options: ['A) En una barca', 'B) En un monte', 'C) En el Templo', 'D) En el desierto'],
        correctIndex: 1, // B
        hint: 'Por eso se le conoce como el "Sermón del...".',
      ),
    ],
  ),
  12: LessonData(
    id: 12,
    title: 'La Parábola del Hijo Pródigo',
    biblicalReference: 'Lucas 15:11-13, 20-24 (RVR1960)',
    biblicalText:
        '"Un hombre tenía dos hijos; y el menor de ellos dijo a su padre: Padre, dame la parte de los bienes que me corresponde... y se fue lejos a una provincia apartada; y allí desperdició sus bienes viviendo perdidamente. [...] Y levantándose, vino a su padre. Y cuando aún estaba lejos, lo vio su padre, y fue movido a misericordia, y corrió, y se echó sobre su cuello, y le besó. Y el hijo le dijo: Padre, he pecado contra el cielo y contra ti... Mas el padre dijo a sus siervos: Sacad el mejor vestido, y vestidle... porque este mi hijo muerto era, y ha reaparecido; se había perdido, y es hallado."',
    explanation:
        'Jesús contó esta parábola para ilustrar el amor incondicional de Dios hacia los pecadores que se arrepienten. El hijo menor representa a la humanidad alejada de Dios, buscando satisfacción en el mundo y perdiéndolo todo. El regreso del hijo no fue recibido con castigo, sino con una fiesta. El Padre (que representa a Dios) estaba esperando ansiosamente. El perdón no se basó en lo que el hijo hizo, sino en el carácter amoroso del Padre.',
    questions: [
      const QuizQuestion(
        question: '¿Qué pidió el hijo menor al inicio de la historia?',
        options: ['A) Permiso para trabajar', 'B) La parte de los bienes (herencia)', 'C) Un caballo', 'D) Libros'],
        correctIndex: 1, // B
        hint: 'Pidió lo que le tocaría tras la muerte de su padre.',
      ),
      const QuizQuestion(
        question: '¿En qué estado terminó el hijo tras desperdiciar su dinero?',
        options: ['A) Fue un gran negociante', 'B) Deseaba comer la comida de los cerdos', 'C) Se hizo rey', 'D) Regresó rico'],
        correctIndex: 1, // B
        hint: 'Llegó a la miseria total trabajando en una granja.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la frase clave cuando el hijo decidió volver?',
        options: ['A) "Voy a exigir mi dinero"', 'B) "Me levantaré e iré a mi padre"', 'C) "Me quedaré aquí"', 'D) "Voy a vengarme"'],
        correctIndex: 1, // B
        hint: 'Es el inicio del arrepentimiento.',
      ),
      const QuizQuestion(
        question: '¿Qué hizo el padre cuando vio a su hijo a lo lejos?',
        options: ['A) Cerró la puerta', 'B) Corrió hacia él y lo besó', 'C) Se puso a llorar de enojo', 'D) Le gritó desde lejos'],
        correctIndex: 1, // B
        hint: 'El padre siempre estuvo esperando y lo recibió con amor.',
      ),
      const QuizQuestion(
        question: '¿Qué confesó el hijo al encontrarse con su padre?',
        options: ['A) Que fue estafado', 'B) Que pecó contra el cielo y contra su padre', 'C) Que no tenía hambre', 'D) Que quería más dinero'],
        correctIndex: 1, // B
        hint: 'Admitió su error espiritual y familiar.',
      ),
      const QuizQuestion(
        question: '¿Qué tres cosas mandó traer el padre para su hijo?',
        options: ['A) Agua, pan y vino', 'B) Vestido, anillo y calzado', 'C) Un látigo y cadenas', 'D) Nada'],
        correctIndex: 1, // B
        hint: 'Símbolos de restauración de su posición como hijo.',
      ),
      const QuizQuestion(
        question: '¿Qué animal mandó matar el padre para la fiesta?',
        options: ['A) Una oveja', 'B) El becerro gordo', 'C) Un pollo', 'D) Un cerdo'],
        correctIndex: 1, // B
        hint: 'Era la mejor comida para una gran celebración.',
      ),
      const QuizQuestion(
        question: '¿Cómo describe el padre el estado previo de su hijo?',
        options: ['A) Estaba de vacaciones', 'B) "Muerto era, y ha reaparecido"', 'C) Estaba trabajando', 'D) Era un genio'],
        correctIndex: 1, // B
        hint: 'La lejanía de Dios se compara con la muerte espiritual.',
      ),
      const QuizQuestion(
        question: '¿Qué representa el Padre en esta parábola?',
        options: ['A) A un hombre rico', 'B) A Dios y Su perdón', 'C) Al gobierno', 'D) A un maestro'],
        correctIndex: 1, // B
        hint: 'Muestra cómo Dios recibe a quien se arrepiente.',
      ),
      const QuizQuestion(
        question: '¿Cómo reaccionó el hijo mayor ante la fiesta?',
        options: ['A) Estaba muy feliz', 'B) Se enojó y no quería entrar', 'C) No se enteró', 'D) Se fue de la casa'],
        correctIndex: 1, // B
        hint: 'Representa a los que creen que el perdón de Dios debe ser ganado y no regalado.',
      ),
    ],
  ),
  13: LessonData(
    id: 13,
    title: 'La Armadura de Dios',
    biblicalReference: 'Efesios 6:11-17 (RVR1960)',
    biblicalText:
        '"Vestíos de toda la armadura de Dios, para que podáis estar firmes contra las asechanzas del diablo. Porque no tenemos lucha contra sangre y carne, sino contra principados, contra potestades... Por tanto, tomad toda la armadura de Dios... Estad, pues, firmes, ceñidos vuestros lomos con la verdad, y vestidos con la coraza de justicia, y calzados los pies con el apresto del evangelio de la paz. Sobre todo, tomad el escudo de la fe... Y tomad el yelmo de la salvación, y la espada del Espíritu, que es la palabra de Dios."',
    explanation:
        'Pablo utiliza la imagen de un soldado romano para explicar cómo los cristianos deben protegerse en la batalla espiritual. La lucha no es contra personas ("carne y sangre"), sino contra fuerzas espirituales del mal. Cada pieza de la armadura protege un área vital: la verdad nos sostiene, la justicia protege el corazón, la fe detiene ataques externos y la Palabra de Dios es nuestra única arma ofensiva.',
    questions: [
      const QuizQuestion(
        question: '¿Contra quién dice Pablo que es nuestra verdadera lucha?',
        options: ['A) Contra otros ejércitos', 'B) Contra carne y sangre (personas)', 'C) Contra principados y huestes espirituales de maldad', 'D) Contra nosotros mismos solamente'],
        correctIndex: 2, // C
        hint: 'Es una batalla de naturaleza espiritual.',
      ),
      const QuizQuestion(
        question: '¿Qué pieza de la armadura protege el pecho (el corazón y órganos vitales)?',
        options: ['A) El casco', 'B) La coraza de justicia', 'C) El escudo', 'D) El calzado'],
        correctIndex: 1, // B
        hint: 'La rectitud protege nuestra vida moral.',
      ),
      const QuizQuestion(
        question: '¿Con qué deben estar ceñidos nuestros lomos (la cintura)?',
        options: ['A) Con oro', 'B) Con la verdad', 'C) Con fuerza', 'D) Con cuerdas'],
        correctIndex: 1, // B
        hint: 'La verdad es lo que mantiene unida toda la armadura.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito del "escudo de la fe"?',
        options: ['A) Para golpear al enemigo', 'B) Para apagar los dardos de fuego del maligno', 'C) Para verse bien', 'D) Para cubrir los pies'],
        correctIndex: 1, // B
        hint: 'La fe nos protege de las dudas y ataques externos.',
      ),
      const QuizQuestion(
        question: '¿Qué protege el "yelmo" (casco)?',
        options: ['A) La salvación protege la mente/cabeza', 'B) Los hombros', 'C) La espalda', 'D) Las manos'],
        correctIndex: 0, // A
        hint: 'La seguridad de ser salvos protege nuestros pensamientos.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la única arma ofensiva mencionada en la lista?',
        options: ['A) El escudo', 'B) La espada del Espíritu', 'C) El calzado', 'D) La coraza'],
        correctIndex: 1, // B
        hint: 'Sirve para atacar y defenderse directamente.',
      ),
      const QuizQuestion(
        question: '¿Qué representa "la espada del Espíritu"?',
        options: ['A) La fuerza humana', 'B) La palabra de Dios', 'C) Los sueños', 'D) El dinero'],
        correctIndex: 1, // B
        hint: 'Jesús la usó contra la tentación citando las Escrituras.',
      ),
      const QuizQuestion(
        question: '¿Qué deben tener los pies como calzado?',
        options: ['A) Botas de hierro', 'B) El apresto (preparación) del evangelio de la paz', 'C) Sandalias de oro', 'D) Nada'],
        correctIndex: 1, // B
        hint: 'La disposición de compartir el mensaje de Cristo nos da estabilidad.',
      ),
      const QuizQuestion(
        question: '¿Para qué sirve toda la armadura según el versículo 11?',
        options: ['A) Para ganar dinero', 'B) Para estar firmes contra las asechanzas del diablo', 'C) Para ser famosos', 'D) Para dormir mejor'],
        correctIndex: 1, // B
        hint: 'Es una protección contra los engaños del enemigo.',
      ),
      const QuizQuestion(
        question: '¿Cómo debemos orar después de ponernos la armadura (v. 18)?',
        options: ['A) Una vez al año', 'B) En todo tiempo con toda oración y súplica en el Espíritu', 'C) Solo en la iglesia', 'D) Nunca'],
        correctIndex: 1, // B
        hint: 'La oración es el motor que hace que la armadura funcione.',
      ),
    ],
  ),
  14: LessonData(
    id: 14,
    title: 'La Parábola del Sembrador',
    biblicalReference: 'Mateo 13:3-8, 18-23 (RVR1960)',
    biblicalText:
        '"He aquí, el sembrador salió a sembrar. Y mientras sembraba, parte de la semilla cayó junto al camino; y vinieron las aves y la comieron. Parte cayó en pedregales... y se secó. Y parte cayó entre espinos; y los espinos crecieron y la ahogaron. Pero parte cayó en buena tierra, y dio fruto... El que fue sembrado en buena tierra, este es el que oye y entiende la palabra, y da fruto."',
    explanation:
        'Jesús usa elementos de la agricultura para explicar cómo diferentes personas reaccionan al mensaje de Dios (la semilla). El estado del "suelo" representa el corazón humano. No es que la semilla sea mala, sino que las distracciones, las pruebas o la dureza del corazón pueden impedir que el mensaje crezca. El objetivo del creyente es cultivar un corazón que sea "buena tierra": alguien que no solo escucha, sino que entiende y pone en práctica lo aprendido.',
    questions: [
      const QuizQuestion(
        question: '¿Qué representa "la semilla" en esta parábola?',
        options: ['A) El dinero', 'B) La palabra del Reino (Dios)', 'C) Los milagros', 'D) El trigo'],
        correctIndex: 1, // B
        hint: 'Es el mensaje que el sembrador esparce.',
      ),
      const QuizQuestion(
        question: '¿Qué sucede con la semilla que cae "junto al camino"?',
        options: ['A) Crece rápido', 'B) Vienen las aves y la comen', 'C) Se ahoga', 'D) Da mucho fruto'],
        correctIndex: 1, // B
        hint: 'El enemigo la quita antes de que brote.',
      ),
      const QuizQuestion(
        question: '¿Por qué se secó la semilla en los "pedregales"?',
        options: ['A) Por mucha agua', 'B) Porque no tenía profundidad de tierra y el sol la quemó', 'C) Por los pájaros', 'D) Porque era mala semilla'],
        correctIndex: 1, // B
        hint: 'Representa a quien recibe con gozo pero no tiene raíces.',
      ),
      const QuizQuestion(
        question: '¿Qué representan "los espinos" que ahogan la palabra?',
        options: ['A) Las enfermedades', 'B) El afán de este siglo y el engaño de las riquezas', 'C) Los enemigos físicos', 'D) El diablo'],
        correctIndex: 1, // B
        hint: 'Son las preocupaciones diarias que nos distraen de Dios.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la característica principal de la "buena tierra"?',
        options: ['A) Que es de color negro', 'B) Que oye, entiende y da fruto', 'C) Que no tiene piedras', 'D) Que está cerca del río'],
        correctIndex: 1, // B
        hint: 'Es la única que logra el propósito de la siembra.',
      ),
      const QuizQuestion(
        question: '¿Quién es el "sembrador" en el sentido espiritual?',
        options: ['A) Un agricultor', 'B) Todo aquel que comparte el mensaje de Cristo', 'C) Un ángel', 'D) El Faraón'],
        correctIndex: 1, // B
        hint: 'Es quien lleva la semilla a otros.',
      ),
      const QuizQuestion(
        question: '¿A qué se refiere Jesús con "las aves del cielo" en su explicación?',
        options: ['A) A los ángeles', 'B) Al malo (el enemigo) que arrebata lo sembrado', 'C) A la naturaleza', 'D) A los pensamientos positivos'],
        correctIndex: 1, // B
        hint: 'Son agentes que roban el mensaje del corazón duro.',
      ),
      const QuizQuestion(
        question: '¿Qué fruto puede dar la semilla en buena tierra según el texto?',
        options: ['A) Solo una uva', 'B) A ciento, a sesenta y a treinta por uno', 'C) Siempre lo mismo', 'D) No da fruto'],
        correctIndex: 1, // B
        hint: 'El rendimiento varía, pero siempre es abundante.',
      ),
      const QuizQuestion(
        question: '¿Qué representan las "piedras" o pedregales en la vida real?',
        options: ['A) Construcciones', 'B) Tropezar en la calle', 'C) Las aflicciones o persecuciones por la palabra', 'D) El pecado oculto'],
        correctIndex: 2, // C
        hint: 'Son pruebas externas que hacen que el creyente sin raíz se rinda.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito final de la semilla?',
        options: ['A) Quedarse en la bolsa', 'B) Alimentar a los pájaros', 'C) Dar fruto', 'D) Adornar el campo'],
        correctIndex: 2, // C
        hint: 'Sin fruto, la siembra no cumplió su objetivo.',
      ),
    ],
  ),
  15: LessonData(
    id: 15,
    title: 'Jesús calma la tempestad',
    biblicalReference: 'Marcos 4:35-41 (RVR1960)',
    biblicalText:
        '"Aquel día, cuando llegó la noche, les dijo: Pasemos al otro lado. [...] Pero se levantó una gran tempestad de viento, y echaba las olas en la barca... Y él estaba en la popa, durmiendo sobre un cabezal; y le despertaron, y le dijeron: ¡Maestro! ¿no tienes cuidado que perecemos? Y levantándose, reprendió al viento, y dijo al mar: Calla, enmudece. Y cesó el viento, y se hizo grande bonanza. Y les dijo: ¿Por qué estáis así amedrentados? ¿Cómo no tenéis fe?"',
    explanation:
        'Este relato muestra la doble naturaleza de Jesús: Su humanidad (estaba cansado y dormía) y Su deidad (tiene autoridad sobre la creación). Los discípulos, a pesar de haber visto milagros, entraron en pánico. Jesús les enseña que la fe no es la ausencia de tormentas, sino la confianza en que Su presencia en nuestra "barca" (vida) es mayor que cualquier peligro externo. Al dar una orden directa al clima, Jesús revela que Él es el Señor de la naturaleza.',
    questions: [
      const QuizQuestion(
        question: '¿Qué estaba haciendo Jesús mientras la tormenta golpeaba la barca?',
        options: ['A) Remando fuerte', 'B) Orando de pie', 'C) Durmiendo sobre un cabezal', 'D) Llorando'],
        correctIndex: 2, // C
        hint: 'Mostraba una paz total a pesar del movimiento.',
      ),
      const QuizQuestion(
        question: '¿En qué lugar de la barca se encontraba Jesús?',
        options: ['A) En la proa (adelante)', 'B) En la popa (atrás)', 'C) En el mástil', 'D) Debajo de los asientos'],
        correctIndex: 1, // B
        hint: 'El versículo 38 indica su ubicación específica.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el reclamo de los discípulos al despertar a Jesús?',
        options: ['A) "Ayúdanos a remar"', 'B) "¿No tienes cuidado que perecemos?"', 'C) "Queremos bajar de la barca"', 'D) "Danos de comer"'],
        correctIndex: 1, // B
        hint: 'Estaban asustados y pensaban que Jesús no se preocupaba por su vida.',
      ),
      const QuizQuestion(
        question: '¿Qué palabras usó Jesús para detener el mar?',
        options: ['A) "Viento, detente por favor"', 'B) "Calla, enmudece"', 'C) "Hágase el sol"', 'D) "Bajen las olas"'],
        correctIndex: 1, // B
        hint: 'Fue una orden directa y con autoridad.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedió inmediatamente después de que Jesús habló?',
        options: ['A) Empezó a llover más', 'B) Se hizo grande bonanza (calma total)', 'C) La barca se hundió', 'D) Los discípulos se durmieron'],
        correctIndex: 1, // B
        hint: 'La naturaleza obedeció al instante.',
      ),
      const QuizQuestion(
        question: '¿Qué les preguntó Jesús a los discípulos después de calmar la tormenta?',
        options: ['A) "¿Tienen hambre?"', 'B) "¿Por qué estáis así amedrentados? ¿Cómo no tenéis fe?"', 'C) "¿A dónde vamos?"', 'D) "¿Quién trajo la barca?"'],
        correctIndex: 1, // B
        hint: 'Les cuestionó su falta de confianza a pesar de estar con Él.',
      ),
      const QuizQuestion(
        question: '¿Cómo reaccionaron los discípulos al ver el milagro (v. 41)?',
        options: ['A) Se rieron', 'B) Temieron con gran temor y se preguntaban quién era Él', 'C) Se enojaron', 'D) No les importó'],
        correctIndex: 1, // B
        hint: 'El poder de Jesús les causó un asombro reverente.',
      ),
      const QuizQuestion(
        question: '¿A quién obedecen el viento y el mar según los discípulos?',
        options: ['A) A los marineros', 'B) A Jesús', 'C) Al azar', 'D) A Moisés'],
        correctIndex: 1, // B
        hint: 'Se dieron cuenta de que Jesús tiene control absoluto.',
      ),
      const QuizQuestion(
        question: '¿Hacia dónde se dirigían en la barca?',
        options: ['A) De regreso a casa', 'B) "Al otro lado" del mar', 'C) A Egipto', 'D) A pescar solamente'],
        correctIndex: 1, // B
        hint: 'Era un viaje con un destino específico ordenado por Jesús.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la lección principal para nuestra vida diaria?',
        options: ['A) Que no debemos viajar en barco', 'B) Que con Jesús podemos tener paz en medio de las tormentas', 'C) Que los discípulos eran malos marineros', 'D) Que el viento es peligroso'],
        correctIndex: 1, // B
        hint: 'La fe vence al miedo cuando confiamos en Su presencia.',
      ),
    ],
  ),
  16: LessonData(
    id: 16,
    title: 'El Llamado y Conversión de Saulo/Pablo',
    biblicalReference: 'Hechos 9:1-6, 15 (RVR1960)',
    biblicalText:
        '"Saulo, respirando aún amenazas y muerte contra los discípulos del Señor... yendo por el camino, aconteció que al llegar cerca de Damasco, repentinamente le rodeó un resplandor de luz del cielo; y cayendo en tierra, oyó una voz que le decía: Saulo, Saulo, ¿por qué me persigues? Él dijo: ¿Quién eres, Señor? Y le dijo: Yo soy Jesús, a quien tú persigues... El Señor le dijo [a Ananías]: Ve, porque instrumento escogido me es este, para llevar mi nombre en presencia de los gentiles."',
    explanation:
        'Saulo de Tarso era el principal perseguidor de la iglesia cristiana primitiva. Sin embargo, tuvo un encuentro sobrenatural con Jesús en el camino a Damasco que cambió su vida para siempre. Quedó ciego por tres días hasta que un hombre llamado Ananías oró por él. Dios transformó al perseguidor en el mayor misionero de la historia, dándole un nuevo nombre (Pablo) y la misión de llevar el evangelio a los no judíos (gentiles) y a reyes.',
    questions: [
      const QuizQuestion(
        question: '¿Hacia qué ciudad se dirigía Saulo para perseguir a los cristianos?',
        options: ['A) Jerusalén', 'B) Roma', 'C) Damasco', 'D) Antioquía'],
        correctIndex: 2, // C
        hint: 'Estaba muy cerca de llegar cuando la luz lo rodeó.',
      ),
      const QuizQuestion(
        question: '¿Qué vio Saulo repentinamente en el camino?',
        options: ['A) Una tormenta', 'B) Un resplandor de luz del cielo', 'C) Un ejército romano', 'D) Un ángel con una espada'],
        correctIndex: 1, // B
        hint: 'Fue una luz tan fuerte que lo hizo caer al suelo.',
      ),
      const QuizQuestion(
        question: '¿Qué pregunta le hizo la voz desde el cielo?',
        options: ['A) "¿A dónde vas?"', 'B) "Saulo, Saulo, ¿por qué me persigues?"', 'C) "¿Quieres ser mi amigo?"', 'D) "¿Por qué tienes miedo?"'],
        correctIndex: 1, // B
        hint: 'Jesús se identificó con los cristianos que estaban sufriendo.',
      ),
      const QuizQuestion(
        question: '¿Cómo quedó Saulo físicamente después del encuentro?',
        options: ['A) Cojo', 'B) Ciego por tres días', 'C) Mudo', 'D) Muy fuerte'],
        correctIndex: 1, // B
        hint: 'Sus compañeros tuvieron que llevarlo de la mano.',
      ),
      const QuizQuestion(
        question: '¿Quién fue el hombre que Dios envió para orar por Saulo en Damasco?',
        options: ['A) Pedro', 'B) Juan', 'C) Ananías', 'D) Esteban'],
        correctIndex: 2, // C
        hint: 'Él tenía miedo de ir porque conocía la fama de Saulo.',
      ),
      const QuizQuestion(
        question: '¿Cómo llamó el Señor a Saulo en el versículo 15?',
        options: ['A) "Un enemigo peligroso"', 'B) "Instrumento escogido"', 'C) "Un pecador sin perdón"', 'D) "Rey de Israel"'],
        correctIndex: 1, // B
        hint: 'Dios ya tenía un propósito específico para su futuro.',
      ),
      const QuizQuestion(
        question: '¿A quiénes debía llevar Pablo el nombre de Jesús principalmente?',
        options: ['A) Solo a los judíos', 'B) A los gentiles (no judíos) y a reyes', 'C) A los egipcios', 'D) A nadie'],
        correctIndex: 1, // B
        hint: 'Su misión era internacional y para todas las personas.',
      ),
      const QuizQuestion(
        question: '¿Qué cayó de los ojos de Saulo cuando Ananías le puso las manos?',
        options: ['A) Lágrimas de sangre', 'B) Como escamas, y recibió la vista', 'C) Polvo', 'D) Nada'],
        correctIndex: 1, // B
        hint: 'Fue una sanidad milagrosa inmediata.',
      ),
      const QuizQuestion(
        question: '¿Qué hizo Saulo inmediatamente después de recuperar la vista y ser bautizado?',
        options: ['A) Se fue a descansar', 'B) Predicaba a Cristo en las sinagogas, diciendo que era el Hijo de Dios', 'C) Regresó a perseguir cristianos', 'D) Se hizo carpintero'],
        correctIndex: 1, // B
        hint: 'Su cambio fue total y público.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la gran enseñanza de la conversión de Pablo?',
        options: ['A) Que Dios no perdona a los malos', 'B) Que nadie es tan "malo" que Dios no pueda transformarlo', 'C) Que viajar a Damasco es peligroso', 'D) Que la luz del sol es muy fuerte'],
        correctIndex: 1, // B
        hint: 'Muestra el poder del perdón y la gracia de Dios.',
      ),
    ],
  ),
  17: LessonData(
    id: 17,
    title: 'La Oración del Padre Nuestro',
    biblicalReference: 'Mateo 6:9-13 (RVR1960)',
    biblicalText:
        '"Vosotros, pues, oraréis así: Padre nuestro que estás en los cielos, santificado sea tu nombre. Venga tu reino. Hágase tu voluntad, como en el cielo, así también en la tierra. El pan nuestro de cada día, dánoslo hoy. Y perdónanos nuestras deudas, como también nosotros perdonamos a nuestros deudores. Y no nos metas en tentación, mas líbranos del mal; porque tuyo es el reino, y el poder, y la gloria, por todos los siglos. Amén."',
    explanation:
        'Jesús no nos dio el Padre Nuestro para que lo repitiéramos como un rezo vacío, sino como un modelo de prioridades al hablar con Dios. Comienza reconociendo la santidad de Dios y Su soberanía (Su voluntad antes que la nuestra), luego pasa a nuestras necesidades físicas (el pan), emocionales (el perdón) y espirituales (protección del mal). Es una oración que equilibra la adoración a Dios con nuestra dependencia total de Él.',
    questions: [
      const QuizQuestion(
        question: '¿A quién debemos dirigir nuestra oración según el modelo de Jesús?',
        options: ['A) A los ángeles', 'B) A nuestro Padre que está en los cielos', 'C) A nosotros mismos', 'D) A los profetas'],
        correctIndex: 1, // B
        hint: 'Jesús enfatiza una relación familiar con Dios.',
      ),
      const QuizQuestion(
        question: '¿Qué significa "Santificado sea tu nombre"?',
        options: ['A) Que el nombre de Dios es un secreto', 'B) Reconocer y tratar el nombre de Dios como sagrado y santo', 'C) Escribir el nombre en oro', 'D) Gritar el nombre'],
        correctIndex: 1, // B
        hint: 'Es un acto de reverencia suprema.',
      ),
      const QuizQuestion(
        question: '¿De quién dice la oración que debe hacerse la voluntad?',
        options: ['A) La del rey de la tierra', 'B) La de Dios, tanto en el cielo como en la tierra', 'C) La de cada persona', 'D) La de los discípulos'],
        correctIndex: 1, // B
        hint: 'Sometemos nuestros planes a los planes divinos.',
      ),
      const QuizQuestion(
        question: '¿Qué representa "el pan nuestro de cada día"?',
        options: ['A) Solo el pan de la panadería', 'B) Nuestra provisión y necesidades básicas diarias', 'C) Un tesoro escondido', 'D) La cena de navidad'],
        correctIndex: 1, // B
        hint: 'Confiamos en que Dios proveerá lo necesario para hoy.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la condición que menciona Jesús sobre el perdón de nuestras "deudas" (pecados)?',
        options: ['A) Que paguemos dinero', 'B) Que nosotros también perdonemos a quienes nos ofenden', 'C) Que hagamos sacrificios', 'D) No hay condición'],
        correctIndex: 1, // B
        hint: 'El perdón de Dios fluye a través de un corazón que también perdona.',
      ),
      const QuizQuestion(
        question: '¿Qué le pedimos a Dios respecto a la "tentación"?',
        options: ['A) Que nos dé fuerza para pecar', 'B) Que no nos meta en ella y nos libre del mal', 'C) Que nos haga famosos', 'D) Que nos ignore'],
        correctIndex: 1, // B
        hint: 'Reconocemos nuestra debilidad y pedimos Su protección espiritual.',
      ),
      const QuizQuestion(
        question: '¿A quién pertenecen el reino, el poder y la gloria según el cierre de la oración?',
        options: ['A) Al Faraón', 'B) A Dios, por todos los siglos', 'C) A los apóstoles', 'D) Al pueblo'],
        correctIndex: 1, // B
        hint: 'Todo reconocimiento final vuelve al Creador.',
      ),
      const QuizQuestion(
        question: '¿En qué lugar dice la oración que está nuestro Padre?',
        options: ['A) En el Templo solamente', 'B) En los cielos', 'C) En una montaña lejos', 'D) En el mar'],
        correctIndex: 1, // B
        hint: 'Indica la morada celestial y autoridad de Dios.',
      ),
      const QuizQuestion(
        question: '¿Qué palabra significa "así sea" o "en verdad" al final de la oración?',
        options: ['A) Aleluya', 'B) Amén', 'C) Gracias', 'D) Salve'],
        correctIndex: 1, // B
        hint: 'Es la palabra que sella la oración con fe.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el orden de prioridades en esta oración?',
        options: ['A) Primero mis problemas y luego Dios', 'B) Primero la gloria de Dios y Su voluntad, luego nuestras necesidades', 'C) Solo pedir dinero', 'D) Solo dar gracias'],
        correctIndex: 1, // B
        hint: 'Los primeros versículos se enfocan totalmente en Dios.',
      ),
    ],
  ),
  18: LessonData(
    id: 18,
    title: 'La Crucifixión y el Sacrificio',
    biblicalReference: 'Juan 19:17-18, 30; Isaías 53:5 (RVR1960)',
    biblicalText:
        '"Y él, cargando su cruz, salió al lugar llamado de la Calavera... y allí le crucificaron. [...] Cuando Jesús hubo tomado el vinagre, dijo: Consumado es. Y habiendo inclinado la cabeza, entregó el espíritu. [...] Mas él herido fue por nuestras rebeliones, molido por nuestros pecados; el castigo de nuestra paz fue sobre él, y por su llaga fuimos nosotros curados."',
    explanation:
        'La muerte de Jesús en la cruz no fue un accidente ni una derrota, sino el cumplimiento del plan de redención de Dios. Como profetizó Isaías siglos antes, Jesús tomó el lugar que nos correspondía a nosotros, pagando por nuestros pecados para que pudiéramos tener paz con Dios. La frase "Consumado es" (del griego Tetelestai) significa "pagado por completo". Con Su sacrificio, la deuda del pecado fue cancelada para todo aquel que cree.',
    questions: [
      const QuizQuestion(
        question: '¿Cómo se llama el lugar donde crucificaron a Jesús?',
        options: ['A) Monte Sinaí', 'B) El Gólgota (Lugar de la Calavera)', 'C) Getsemaní', 'D) Belén'],
        correctIndex: 1, // B
        hint: 'Estaba ubicado a las afueras de Jerusalén.',
      ),
      const QuizQuestion(
        question: '¿Qué cargaba Jesús camino al lugar de la crucifixión?',
        options: ['A) Una corona de oro', 'B) Su propia cruz', 'C) Un libro de leyes', 'D) Nada'],
        correctIndex: 1, // B
        hint: 'Fue parte de Su sufrimiento físico camino al sacrificio.',
      ),
      const QuizQuestion(
        question: '¿Qué profeta predijo que Jesús sería "herido por nuestras rebeliones"?',
        options: ['A) Daniel', 'B) Isaías', 'C) Jonás', 'D) Noé'],
        correctIndex: 1, // B
        hint: 'Es conocido como el "profeta mesiánico" en el Antiguo Testamento.',
      ),
      const QuizQuestion(
        question: '¿Qué significa la frase final de Jesús: "Consumado es"?',
        options: ['A) "Estoy muy cansado"', 'B) "La obra de salvación está completa/pagada"', 'C) "Todo se ha perdido"', 'D) "Regresaré pronto"'],
        correctIndex: 1, // B
        hint: 'Es un término contable que indica que una deuda se saldó.',
      ),
      const QuizQuestion(
        question: '¿Qué entregó Jesús al morir voluntariamente?',
        options: ['A) Sus riquezas', 'B) Su espíritu', 'C) Sus vestidos solamente', 'D) Su odio'],
        correctIndex: 1, // B
        hint: 'Él tuvo el control de Su vida hasta el último aliento.',
      ),
      const QuizQuestion(
        question: 'Según Isaías 53, ¿por qué fue castigado Jesús?',
        options: ['A) Por Sus propios errores', 'B) Por nuestras rebeliones y pecados', 'C) Porque no sabía defenderse', 'D) Por orden de los reyes'],
        correctIndex: 1, // B
        hint: 'Él fue nuestro sustituto en la cruz.',
      ),
      const QuizQuestion(
        question: '¿Qué beneficio recibimos nosotros a través de Sus llagas (heridas)?',
        options: ['A) Somos juzgados', 'B) Fuimos nosotros curados/sanados', 'C) Tenemos más dinero', 'D) Nada'],
        correctIndex: 1, // B
        hint: 'Se refiere a la sanidad espiritual y restauración con Dios.',
      ),
      const QuizQuestion(
        question: '¿Cuántas personas más fueron crucificadas junto a Jesús?',
        options: ['A) Nadie más', 'B) Dos (uno a cada lado)', 'C) Diez personas', 'D) Todo el ejército'],
        correctIndex: 1, // B
        hint: 'Eran dos malhechores.',
      ),
      const QuizQuestion(
        question: '¿Qué le pusieron en la cabeza a Jesús para burlarse de Su título de Rey?',
        options: ['A) Un casco de acero', 'B) Una corona de espinas', 'C) Un sombrero de seda', 'D) Una venda negra'],
        correctIndex: 1, // B
        hint: 'Fue un instrumento de dolor y humillación.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el resultado del castigo que cayó sobre Él?',
        options: ['A) Nuestra tristeza', 'B) Nuestra paz con Dios', 'C) El fin del mundo', 'D) El olvido'],
        correctIndex: 1, // B
        hint: 'Él llevó el castigo para que nosotros tuviéramos reconciliación.',
      ),
    ],
  ),
  19: LessonData(
    id: 19,
    title: 'La Fe de la Mujer Cananea',
    biblicalReference: 'Mateo 15:22-28 (RVR1960)',
    biblicalText:
        '"Y he aquí una mujer cananea... salió gritando, diciéndole: ¡Señor, Hijo de David, ten misericordia de mí! Mi hija es gravemente atormentada por un demonio. Pero Jesús no le respondió palabra. [...] Entonces ella vino y se postró ante él, diciendo: ¡Señor, ayúdame! Respondiendo él, dijo: No está bien tomar el pan de los hijos y echarlo a los perritos. Y ella dijo: Sí, Señor; pero aun los perritos comen de las migajas que caen de la mesa de sus amos. Entonces respondiendo Jesús, dijo: Oh mujer, grande es tu fe; hágase contigo como quieres."',
    explanation:
        'Esta historia resalta la importancia de la persistencia y la humildad en la fe. La mujer no era judía (era cananea), por lo que legalmente no tenía "derecho" a las bendiciones de Israel. Jesús probó su fe con un silencio inicial y luego con una comparación difícil. En lugar de ofenderse, la mujer reconoció su posición y confió tanto en la bondad de Jesús que aceptó ser comparada con un "perrito" con tal de recibir una "migaja" de Su poder. Jesús alabó su fe como "grande".',
    questions: [
      const QuizQuestion(
        question: '¿De qué origen era la mujer que buscaba a Jesús?',
        options: ['A) Judía', 'B) Cananea', 'C) Egipcia', 'D) Romana'],
        correctIndex: 1, // B
        hint: 'Era una extranjera para el pueblo de Israel.',
      ),
      const QuizQuestion(
        question: '¿Qué problema tenía la hija de esta mujer?',
        options: ['A) Estaba ciega', 'B) Era atormentada por un demonio', 'C) Tenía fiebre', 'D) Estaba perdida'],
        correctIndex: 1, // B
        hint: 'Era un problema espiritual grave.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la primera reacción de Jesús ante los gritos de la mujer?',
        options: ['A) La sanó de inmediato', 'B) No le respondió palabra', 'C) Se enojó con ella', 'D) Se fue corriendo'],
        correctIndex: 1, // B
        hint: 'Fue una prueba de silencio para ver si ella insistiría.',
      ),
      const QuizQuestion(
        question: '¿Cómo llamó la mujer a Jesús al pedir ayuda?',
        options: ['A) "Maestro de la ley"', 'B) "¡Señor, Hijo de David!"', 'C) "Hombre bueno"', 'D) "Rey de los cananeos"'],
        correctIndex: 1, // B
        hint: 'Reconoció Su título mesiánico aunque ella no era judía.',
      ),
      const QuizQuestion(
        question: '¿Qué actitud tomó la mujer cuando Jesús no le respondía?',
        options: ['A) Se fue a su casa', 'B) Vino y se postró ante Él', 'C) Empezó a insultar a los discípulos', 'D) Se puso a llorar sola'],
        correctIndex: 1, // B
        hint: 'Se humilló profundamente ante Su presencia.',
      ),
      const QuizQuestion(
        question: '¿A qué se refería Jesús con el "pan de los hijos"?',
        options: ['A) Al pan físico que estaban comiendo', 'B) A las bendiciones y milagros destinados primero al pueblo de Israel', 'C) A una receta especial', 'D) A los niños del pueblo'],
        correctIndex: 1, // B
        hint: 'El evangelio fue predicado primero a los judíos.',
      ),
      const QuizQuestion(
        question: '¿Cómo respondió la mujer a la frase de los "perritos"?',
        options: ['A) Se ofendió y se fue', 'B) Dijo que aun los perritos comen las migajas que caen de la mesa', 'C) Dijo que ella no era un perro', 'D) No supo qué decir'],
        correctIndex: 1, // B
        hint: 'Usó el mismo argumento de Jesús para mostrar su confianza en Su generosidad.',
      ),
      const QuizQuestion(
        question: '¿Cómo calificó Jesús la fe de esta mujer al final?',
        options: ['A) Fe pequeña', 'B) Fe inexistente', 'C) ¡Grande es tu fe!', 'D) Fe normal'],
        correctIndex: 2, // C
        hint: 'Pocas veces Jesús elogió a alguien de esa manera.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedió con la hija de la mujer?',
        options: ['A) Fue sanada desde aquella hora', 'B) Siguió igual', 'C) Jesús tuvo que ir a su casa', 'D) Se olvidaron de ella'],
        correctIndex: 0, // A
        hint: 'La palabra de Jesús tuvo efecto inmediato a la distancia.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la lección principal sobre la oración en esta historia?',
        options: ['A) Que no hay que gritar', 'B) Que la fe persistente y humilde mueve el corazón de Dios', 'C) Que Jesús solo ayuda a los judíos', 'D) Que los perros son importantes'],
        correctIndex: 1, // B
        hint: 'Nos enseña a no rendirnos a pesar de las dificultades.',
      ),
    ],
  ),
  20: LessonData(
    id: 20,
    title: 'La Resurrección de Lázaro',
    biblicalReference: 'Juan 11:21, 25-26, 39-44 (RVR1960)',
    biblicalText:
        '"Y Marta dijo a Jesús: Señor, si hubieses estado aquí, mi hermano no habría muerto. [...] Le dijo Jesús: Yo soy la resurrección y la vida; el que cree en mí, aunque esté muerto, vivirá. [...] Dijo Jesús: Quitad la piedra. Marta... le dijo: Señor, hiede ya, porque es de cuatro días. Jesús le dijo: ¿No te he dicho que si crees, verás la gloria de Dios? [...] Y habiendo dicho esto, clamó a gran voz: ¡Lázaro, ven fuera! Y el que había muerto salió, atadas las manos y los pies con vendas, y el rostro envuelto en un sudario."',
    explanation:
        'Este milagro es la señal definitiva de la divinidad de Jesús antes de Su propia muerte. Lázaro, un amigo cercano de Jesús, llevaba cuatro días muerto cuando Jesús llegó a Betania. El retraso de Jesús no fue descuido, sino un plan para mostrar que Su poder no tiene límites de tiempo ni de estado físico. Al resucitar a Lázaro, Jesús confirma Su declaración: Él no solo da vida, Él es la Vida. Para el creyente, esta historia es una garantía de que la muerte física no es el final.',
    questions: [
      const QuizQuestion(
        question: '¿Quiénes eran las dos hermanas de Lázaro que enviaron a llamar a Jesús?',
        options: ['A) María y Magdalena', 'B) Marta y María', 'C) Raquel y Lea', 'D) Ruth y Noemí'],
        correctIndex: 1, // B
        hint: 'Vivían en Betania y eran seguidoras muy cercanas de Jesús.',
      ),
      const QuizQuestion(
        question: '¿Cuántos días llevaba Lázaro en el sepulcro cuando Jesús llegó?',
        options: ['A) Un día', 'B) Dos días', 'C) Cuatro días', 'D) Una semana'],
        correctIndex: 2, // C
        hint: 'En la cultura judía, después del tercer día se consideraba que el alma ya no estaba cerca del cuerpo.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el reclamo de Marta al encontrarse con Jesús?',
        options: ['A) "Señor, ¿por qué no nos avisaste?"', 'B) "Señor, si hubieses estado aquí, mi hermano no habría muerto"', 'C) "Señor, danos dinero para el entierro"', 'D) "Señor, vete de aquí"'],
        correctIndex: 1, // B
        hint: 'Ella creía que Jesús podía sanar enfermos, pero aún no comprendía que podía resucitar muertos de varios días.',
      ),
      const QuizQuestion(
        question: '¿Qué título se dio Jesús a sí mismo en el versículo 25?',
        options: ['A) "El pan de vida"', 'B) "La luz del mundo"', 'C) "Yo soy la resurrección y la vida"', 'D) "El buen pastor"'],
        correctIndex: 2, // C
        hint: 'Es una de las declaraciones "Yo Soy" más poderosas de Jesús.',
      ),
      const QuizQuestion(
        question: '¿Qué obstáculo pidió Jesús que quitaran antes del milagro?',
        options: ['A) Una muralla de madera', 'B) La piedra del sepulcro', 'C) Las flores del camino', 'D) Los soldados romanos'],
        correctIndex: 1, // B
        hint: 'Era la entrada a la cueva donde estaba el cuerpo.',
      ),
      const QuizQuestion(
        question: '¿Por qué Marta dudó al principio de quitar la piedra?',
        options: ['A) Porque tenía miedo de los fantasmas', 'B) Porque el cuerpo ya olía mal (hedía) por el tiempo transcurrido', 'C) Porque la piedra era muy pesada', 'D) Porque no quería ver a su hermano'],
        correctIndex: 1, // B
        hint: 'El proceso de descomposición natural ya había comenzado.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la condición que Jesús le recordó a Marta para "ver la gloria de Dios"?',
        options: ['A) Tener mucho dinero', 'B) Hacer sacrificios', 'C) Si crees', 'D) Ser una buena persona'],
        correctIndex: 2, // C
        hint: 'Jesús siempre enfatiza que la fe es la llave para ver Su poder.',
      ),
      const QuizQuestion(
        question: '¿Qué frase gritó Jesús con autoridad frente a la tumba?',
        options: ['A) "¡Levántate, hombre!"', 'B) "¡Dios mío, ayúdame!"', 'C) "¡Lázaro, ven fuera!"', 'D) "¡Salid todos de aquí!"'],
        correctIndex: 2, // C
        hint: 'Llamó a Lázaro por su nombre para que solo él saliera del descanso.',
      ),
      const QuizQuestion(
        question: '¿En qué estado físico salió Lázaro de la tumba?',
        options: ['A) Con ropa nueva y limpia', 'B) Atado de pies y manos con vendas y el rostro envuelto en un sudario', 'C) Corriendo y gritando', 'D) Salió como un niño pequeño'],
        correctIndex: 1, // B
        hint: 'Salió con las mismas envolturas con las que se enterraba a los difuntos.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito espiritual de este milagro según la explicación?',
        options: ['A) Mostrar que Jesús era un buen médico', 'B) Demostrar que Jesús tiene autoridad absoluta sobre la muerte', 'C) Hacerse famoso en Betania', 'D) Castigar a los que no creían'],
        correctIndex: 1, // B
        hint: 'Valida que quien cree en Jesús vivirá aunque muera físicamente.',
      ),
    ],
  ),
  21: LessonData(
    id: 21,
    title: 'El Tabernáculo y su Simbolismo',
    biblicalReference: 'Éxodo 25:8-9, 22; Hebreos 9:11-12 (RVR1960)',
    biblicalText:
        '"Y harán un santuario para mí, y habitaré en medio de ellos. Conforme a todo lo que yo te muestre, el diseño del tabernáculo... así lo haréis. [...] Y de allí me declararé a ti, y hablaré contigo de sobre el propiciatorio... [...] Pero estando ya presente Cristo, sumo sacerdote de los bienes venideros, por el más amplio y más perfecto tabernáculo, no hecho de manos... y no por sangre de machos cabríos ni de becerros, sino por su propia sangre, entró una vez para siempre en el Lugar Santísimo, habiendo obtenido eterna redención."',
    explanation:
        'El Tabernáculo era una tienda móvil que servía como morada de Dios entre Su pueblo en el desierto. Cada detalle (el Atrio, el Lugar Santo y el Lugar Santísimo) tenía un significado profético. El Lugar Santísimo contenía el Arca del Pacto, y solo el Sumo Sacerdote podía entrar una vez al año. Según Hebreos, el Tabernáculo era una "sombra" de lo celestial; Jesús es nuestro Sumo Sacerdote que entró no en una tienda terrenal, sino en el cielo mismo, ofreciendo Su propia sangre como el sacrificio perfecto y definitivo.',
    questions: [
      const QuizQuestion(
        question: '¿Cuál era el propósito principal del Tabernáculo según Éxodo 25:8?',
        options: ['A) Ser un fuerte militar', 'B) Que Dios habitara en medio de Su pueblo', 'C) Guardar el oro de Egipto', 'D) Una escuela para levitas'],
        correctIndex: 1, // B
        hint: 'Dios quería cercanía con Israel.',
      ),
      const QuizQuestion(
        question: '¿Quién podía entrar al Lugar Santísimo y con qué frecuencia?',
        options: ['A) Moisés cada día', 'B) El Sumo Sacerdote una vez al año', 'C) Cualquier levita', 'D) Los reyes de Israel'],
        correctIndex: 1, // B
        hint: 'Era el lugar más sagrado y restringido.',
      ),
      const QuizQuestion(
        question: '¿Qué objeto se encontraba dentro del Lugar Santísimo?',
        options: ['A) El Altar de Bronce', 'B) El Arca del Pacto', 'C) El Candelabro', 'D) La Mesa de los panes'],
        correctIndex: 1, // B
        hint: 'Representaba el trono y la presencia de Dios.',
      ),
      const QuizQuestion(
        question: 'Según Hebreos 9, ¿por qué el tabernáculo de Cristo es superior?',
        options: ['A) Porque es más grande', 'B) Porque no es hecho de manos humanas', 'C) Porque es de oro puro', 'D) Porque está en Jerusalén'],
        correctIndex: 1, // B
        hint: 'Es de naturaleza espiritual y celestial.',
      ),
      const QuizQuestion(
        question: '¿Qué sacrificio presentó Jesús para entrar al santuario celestial?',
        options: ['A) Sangre de machos cabríos', 'B) Su propia sangre', 'C) Incienso puro', 'D) Diezmos del pueblo'],
        correctIndex: 1, // B
        hint: 'Fue un sacrificio voluntario y personal.',
      ),
      const QuizQuestion(
        question: '¿Qué es el "Propiciatorio" mencionado en el texto?',
        options: ['A) Una puerta de madera', 'B) La cubierta del Arca donde Dios hablaba', 'C) El patio exterior', 'D) Un tipo de incienso'],
        correctIndex: 1, // B
        hint: 'Era el lugar donde se rociaba la sangre para el perdón.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que el tabernáculo terrenal era una "sombra"?',
        options: ['A) Que era oscuro', 'B) Que era una representación temporal de una realidad superior', 'C) Que se movía con el sol', 'D) Que no era real'],
        correctIndex: 1, // B
        hint: 'Apuntaba hacia la obra venidera de Cristo.',
      ),
      const QuizQuestion(
        question: '¿Qué dividía el Lugar Santo del Lugar Santísimo?',
        options: ['A) Una pared de piedra', 'B) Un velo grueso', 'C) Una puerta de hierro', 'D) Un río'],
        correctIndex: 1, // B
        hint: 'Este velo se rasgó cuando Jesús murió.',
      ),
      const QuizQuestion(
        question: '¿Qué tipo de redención obtuvo Cristo según Hebreos 9:12?',
        options: ['A) Redención temporal', 'B) Eterna redención', 'C) Redención para pocos', 'D) Redención política'],
        correctIndex: 1, // B
        hint: 'Su efecto no tiene fin en el tiempo.',
      ),
      const QuizQuestion(
        question: '¿Bajo qué diseño debía construirse el tabernáculo?',
        options: ['A) Bajo el gusto de Moisés', 'B) Conforme al modelo mostrado por Dios', 'C) Según la arquitectura egipcia', 'D) Como el pueblo decidiera'],
        correctIndex: 1, // B
        hint: 'Dios fue muy específico con cada medida y material.',
      ),
    ],
  ),
  22: LessonData(
    id: 22,
    title: 'Las Setenta Semanas de Daniel',
    biblicalReference: 'Daniel 9:24-26 (RVR1960)',
    biblicalText:
        '"Setenta semanas están determinadas sobre tu pueblo y sobre tu santa ciudad, para terminar la prevaricación, y poner fin al pecado, y expiar la iniquidad... Sabe, pues, y entiende, que desde la salida de la orden para restaurar y edificar a Jerusalén hasta el Mesías Príncipe, habrá siete semanas, y sesenta y dos semanas... Y después de las sesenta y dos semanas se quitará la vida al Mesías, mas no por sí; y el pueblo de un príncipe que ha de venir destruirá la ciudad y el santuario..."',
    explanation:
        'Esta es una de las profecías cronológicas más exactas de la Biblia. Las "semanas" aquí se interpretan como semanas de años (periodos de 7 años). La profecía detalla el tiempo exacto desde el decreto para reconstruir Jerusalén hasta la llegada y muerte del Mesías. Es un nivel difícil porque requiere entender que la "muerte del Mesías" (Jesús) ocurrió exactamente al final de la semana 69, dejando una "semana 70" pendiente para los tiempos finales, marcando el destino de Israel y la victoria sobre el pecado.',
    questions: [
      const QuizQuestion(
        question: '¿Sobre quiénes están determinadas las 70 semanas?',
        options: ['A) Sobre todo el mundo', 'B) Sobre el pueblo de Daniel (Israel) y su santa ciudad', 'C) Sobre los babilonios', 'D) Sobre la iglesia gentil'],
        correctIndex: 1, // B
        hint: 'Es una profecía específica para el pueblo judío.',
      ),
      const QuizQuestion(
        question: '¿Qué evento marca el inicio del conteo de las semanas?',
        options: ['A) El nacimiento de Daniel', 'B) La orden para restaurar y edificar a Jerusalén', 'C) La caída de Babilonia', 'D) El diluvio'],
        correctIndex: 1, // B
        hint: 'Fue un decreto real histórico.',
      ),
      const QuizQuestion(
        question: 'En profecía bíblica, ¿cuántos años representa usualmente una "semana"?',
        options: ['A) 7 días', 'B) 7 años', 'C) 70 años', 'D) 1 año'],
        correctIndex: 1, // B
        hint: 'Se basa en el ciclo de años sabáticos de Israel.',
      ),
      const QuizQuestion(
        question: '¿Cuántas semanas pasarían en total hasta la llegada del Mesías Príncipe?',
        options: ['A) 70 semanas', 'B) 69 semanas (7 + 62)', 'C) 7 semanas solamente', 'D) 100 semanas'],
        correctIndex: 1, // B
        hint: 'Suma los dos primeros periodos mencionados.',
      ),
      const QuizQuestion(
        question: '¿Qué le sucedería al Mesías después de las 62 semanas adicionales?',
        options: ['A) Sería coronado rey físico', 'B) Se le quitaría la vida, mas no por sí', 'C) Se iría a otro país', 'D) Se volvería un ángel'],
        correctIndex: 1, // B
        hint: 'Predice Su muerte sacrificial por otros.',
      ),
      const QuizQuestion(
        question: '¿Cuál es uno de los propósitos de estas semanas según el v. 24?',
        options: ['A) Hacerse rico', 'B) Poner fin al pecado y expiar la iniquidad', 'C) Destruir el mundo', 'D) Construir un palacio'],
        correctIndex: 1, // B
        hint: 'Tiene un objetivo de limpieza espiritual profunda.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedería con la ciudad y el santuario tras la muerte del Mesías?',
        options: ['A) Serían ampliados', 'B) El pueblo de un príncipe que ha de venir los destruiría', 'C) Serían escondidos', 'D) Permanecerían en paz'],
        correctIndex: 1, // B
        hint: 'Se cumplió históricamente en el año 70 d.C.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que el Mesías moriría "mas no por sí"?',
        options: ['A) Que murió por accidente', 'B) Que no murió por sus propios pecados, sino por otros', 'C) Que no murió realmente', 'D) Que se suicidó'],
        correctIndex: 1, // B
        hint: 'Resalta la naturaleza sustitutiva de Su muerte.',
      ),
      const QuizQuestion(
        question: '¿A qué ciudad se refiere el texto como "tu santa ciudad"?',
        options: ['A) Roma', 'B) Jerusalén', 'C) Babilonia', 'D) Belén'],
        correctIndex: 1, // B
        hint: 'Es la ciudad central de la fe judía.',
      ),
      const QuizQuestion(
        question: '¿Cuántas semanas quedan mencionadas pero ocurren en un periodo distinto al final?',
        options: ['A) 1 semana (la semana 70)', 'B) 10 semanas', 'C) Ninguna', 'D) 5 semanas'],
        correctIndex: 0, // A
        hint: 'Es el periodo que muchos teólogos asocian con el fin de los tiempos.',
      ),
    ],
  ),
  23: LessonData(
    id: 23,
    title: 'La Justificación por la Fe en Romanos',
    biblicalReference: 'Romanos 3:21-26; 5:1 (RVR1960)',
    biblicalText:
        '"Pero ahora, aparte de la ley, se ha manifestado la justicia de Dios... por medio de la fe en Jesucristo, para todos los que creen en él. Porque no hay diferencia, por cuanto todos pecaron, y están destituidos de la gloria de Dios, siendo justificados gratuitamente por su gracia, mediante la redención que es en Cristo Jesús... Justificados, pues, por la fe, tenemos paz para con Dios por medio de nuestro Señor Jesucristo."',
    explanation:
        'La Epístola a los Romanos es el tratado teológico más profundo de Pablo. El concepto central es la Justificación: el acto legal por el cual Dios declara justo al pecador. Pablo argumenta que nadie puede ser salvo cumpliendo la Ley, porque nadie la cumple perfectamente ("todos pecaron"). La justicia no se gana, se recibe por gracia a través de la fe. Estar "justificado" significa que, ante el tribunal de Dios, nuestra deuda es borrada y somos vistos como si nunca hubiéramos pecado, gracias al sacrificio de Cristo.',
    questions: [
      const QuizQuestion(
        question: '¿Cómo se manifiesta la justicia de Dios según el capítulo 3?',
        options: ['A) Por cumplir los 10 mandamientos', 'B) Por medio de la fe en Jesucristo', 'C) Por hacer muchas obras buenas', 'D) Por ser descendiente de Abraham'],
        correctIndex: 1, // B
        hint: 'Es un regalo que se recibe, no un salario que se gana.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la condición de toda la humanidad según el versículo 23?',
        options: ['A) Todos son básicamente buenos', 'B) Todos pecaron y están destituidos de la gloria de Dios', 'C) Algunos son justos por sí mismos', 'D) Solo los gentiles pecaron'],
        correctIndex: 1, // B
        hint: 'Pablo establece una culpabilidad universal.',
      ),
      const QuizQuestion(
        question: '¿Qué significa ser "justificado gratuitamente"?',
        options: ['A) Que no tiene valor', 'B) Que se recibe sin costo alguno para nosotros, por pura gracia', 'C) Que es una oferta limitada', 'D) Que debemos pagarlo después'],
        correctIndex: 1, // B
        hint: 'El costo lo pagó otro, para nosotros es un don.',
      ),
      const QuizQuestion(
        question: '¿A través de qué medio obtenemos la paz con Dios (Rom 5:1)?',
        options: ['A) A través de la meditación', 'B) A través de la fe, siendo justificados', 'C) A través de la ley', 'D) A través del sufrimiento'],
        correctIndex: 1, // B
        hint: 'La paz es el resultado de haber sido declarados inocentes legalmente.',
      ),
      const QuizQuestion(
        question: '¿Qué significa el término teológico "Redención"?',
        options: ['A) Olvidar el pasado', 'B) Rescatar mediante el pago de un precio', 'C) Un sentimiento de alegría', 'D) Ser muy inteligente'],
        correctIndex: 1, // B
        hint: 'Cristo pagó el precio de nuestra libertad en la cruz.',
      ),
      const QuizQuestion(
        question: '¿Por qué la ley no puede justificar a nadie?',
        options: ['A) Porque la ley es mala', 'B) Porque nadie puede cumplirla perfectamente debido al pecado', 'C) Porque es muy antigua', 'D) Porque Dios la canceló'],
        correctIndex: 1, // B
        hint: 'La ley sirve para mostrar el pecado, no para quitarlo.',
      ),
      const QuizQuestion(
        question: '¿Quién es el único que puede justificar al hombre?',
        options: ['A) El hombre mismo', 'B) Dios, a través de la obra de Cristo', 'C) Los ángeles', 'D) El destino'],
        correctIndex: 1, // B
        hint: 'Es una declaración soberana del Juez Supremo.',
      ),
      const QuizQuestion(
        question: '¿Para quiénes está disponible esta justicia de Dios?',
        options: ['A) Solo para los judíos', 'B) Para todos los que creen en Él, sin diferencia', 'C) Solo para la gente culta', 'D) Para los que nunca han fallado'],
        correctIndex: 1, // B
        hint: 'No hay distinción de raza o pasado si hay fe.',
      ),
      const QuizQuestion(
        question: '¿Qué papel tiene la "gracia" en la justificación?',
        options: ['A) Es un premio al esfuerzo', 'B) Es la base gratuita del perdón de Dios', 'C) Es algo que se compra', 'D) Es un adorno espiritual'],
        correctIndex: 1, // B
        hint: 'Gracia es favor inmerecido.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el resultado inmediato de la justificación en la vida del creyente?',
        options: ['A) Riqueza material', 'B) Paz para con Dios', 'C) Ausencia de problemas', 'D) Superioridad sobre otros'],
        correctIndex: 1, // B
        hint: 'Se termina la enemistad espiritual con el Creador.',
      ),
    ],
  ),
  24: LessonData(
    id: 24,
    title: 'El Sumo Sacerdote y las Vestiduras Sagradas',
    biblicalReference: 'Éxodo 28:1-4, 12, 29-30 (RVR1960)',
    biblicalText:
        '"Harás vestir a Aarón tu hermano... para que sean para honra y hermosura. [...] Y pondrás las dos piedras de ónice sobre las hombreras del efod, para piedras de memoria a los hijos de Israel. [...] Y llevará Aarón los nombres de los hijos de Israel en el pectoral del juicio sobre su corazón... para memoria continua delante de Jehová. Y pondrás en el pectoral del juicio el Urim y el Tumim, para que estén sobre el corazón de Aarón cuando entre delante de Jehová."',
    explanation:
        'Las vestiduras del Sumo Sacerdote no eran simples adornos; cada pieza era un símbolo teológico. El Efod (una especie de delantal) y el Pectoral (con 12 piedras preciosas) representaban que el sacerdote cargaba el peso (en los hombros) y el amor (en el corazón) de todo el pueblo ante Dios. El Urim y el Tumim eran medios que Dios usaba para revelar Su voluntad o dar un "juicio" ante dudas nacionales. Todo esto apuntaba a Cristo, nuestro Gran Sumo Sacerdote, quien intercede por nosotros llevando nuestros nombres ante el Padre.',
    questions: [
      const QuizQuestion(
        question: '¿Qué representaban las 12 piedras preciosas en el pectoral del Sumo Sacerdote?',
        options: ['A) Los 12 meses del año', 'B) Las 12 tribus de los hijos de Israel', 'C) Los 12 apóstoles', 'D) La riqueza del templo'],
        correctIndex: 1, // B
        hint: 'Cada piedra tenía grabado un nombre específico de la nación.',
      ),
      const QuizQuestion(
        question: '¿Dónde llevaba el sacerdote los nombres del pueblo "para memoria continua"?',
        options: ['A) En sus manos y pies', 'B) Sobre sus hombros y sobre su corazón', 'C) En su frente', 'D) En un libro'],
        correctIndex: 1, // B
        hint: 'Indica que el sacerdote sostiene y ama a quienes representa.',
      ),
      const QuizQuestion(
        question: '¿Para qué servían el Urim y el Tumim guardados en el pectoral?',
        options: ['A) Para iluminar el lugar', 'B) Para consultar la voluntad o el juicio de Dios', 'C) Eran monedas para limosna', 'D) Eran joyas de repuesto'],
        correctIndex: 1, // B
        hint: 'Se usaban para obtener respuestas de "Sí" o "No" de parte de Dios.',
      ),
      const QuizQuestion(
        question: '¿Cuál era el propósito de las vestiduras según el versículo 2?',
        options: ['A) Para proteger del frío', 'B) Para honra y hermosura', 'C) Para esconderse del pueblo', 'D) Para parecer más altos'],
        correctIndex: 1, // B
        hint: 'Debían reflejar la gloria de la santidad de Dios.',
      ),
      const QuizQuestion(
        question: '¿Qué material se usó para las hombreras donde se grabaron los nombres?',
        options: ['A) Madera de cedro', 'B) Piedras de ónice', 'C) Oro puro sólido', 'D) Cuero de oveja'],
        correctIndex: 1, // B
        hint: 'El ónice es una piedra semipreciosa muy resistente.',
      ),
      const QuizQuestion(
        question: '¿Quién fue el primer hombre designado por Dios para usar estas vestiduras?',
        options: ['A) Moisés', 'B) Aarón', 'C) Josué', 'D) Melquisedec'],
        correctIndex: 1, // B
        hint: 'Fue el hermano de Moisés y cabeza de los sacerdotes.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que el sacerdote llevara el pectoral "sobre su corazón"?',
        options: ['A) Que era muy pesado', 'B) Que Dios ama a Su pueblo y el mediador debe sentir ese amor', 'C) Que servía de escudo', 'D) Que era una medicina'],
        correctIndex: 1, // B
        hint: 'Es un símbolo de intercesión basada en el afecto y cuidado.',
      ),
      const QuizQuestion(
        question: '¿Por qué se le llama "Pectoral del Juicio"?',
        options: ['A) Porque servía para castigar', 'B) Porque a través de él se conocía la decisión o juicio divino', 'C) Porque era para jueces', 'D) Porque pesaba mucho'],
        correctIndex: 1, // B
        hint: 'Estaba ligado a la toma de decisiones importantes.',
      ),
      const QuizQuestion(
        question: '¿Qué pieza de ropa sostenía el pectoral?',
        options: ['A) La túnica blanca', 'B) El efod', 'C) El manto azul', 'D) La mitra'],
        correctIndex: 1, // B
        hint: 'El efod era la pieza exterior tejida con hilos de oro, azul, púrpura y carmesí.',
      ),
      const QuizQuestion(
        question: 'En el Nuevo Testamento, ¿quién cumple perfectamente el rol del Sumo Sacerdote?',
        options: ['A) El Papa', 'B) Jesucristo', 'C) Los pastores', 'D) Pablo'],
        correctIndex: 1, // B
        hint: 'Hebreos dice que Él entró al santuario celestial por nosotros.',
      ),
    ],
  ),
  25: LessonData(
    id: 25,
    title: 'El Sufrimiento y la Soberanía en Job',
    biblicalReference: 'Job 1:21; 2:10; 42:2, 5 (RVR1960)',
    biblicalText:
        '"Y dijo: Desnudo salí del vientre de mi madre, y desnudo volveré allá. Jehová dio, y Jehová quitó; sea el nombre de Jehová bendito. [...] ¿Recibiremos de Dios el bien, y el mal no lo recibiremos? [...] Yo conozco que todo lo puedes, y que no hay pensamiento que se esconda de ti. De oídas te había oído; mas ahora mis ojos te ven."',
    explanation:
        'El libro de Job aborda el problema del sufrimiento del justo. Job perdió sus bienes, sus hijos y su salud en un solo día. Sus amigos insistían en que sufría por algún pecado oculto, pero el texto revela que era una prueba de integridad. El nivel difícil aquí es entender que la respuesta de Dios a Job no fue explicarle por qué sufría, sino mostrarle Su soberanía y sabiduría infinita sobre la creación. Job aprendió que Dios no nos debe explicaciones, y que conocer a Dios personalmente en la prueba es superior a cualquier bendición material.',
    questions: [
      const QuizQuestion(
        question: '¿Cuál fue la reacción inicial de Job tras perder a sus hijos y bienes?',
        options: ['A) Maldijo a Dios', 'B) Se quitó la vida', 'C) Adoró diciendo: "Sea el nombre de Jehová bendito"', 'D) Se enojó con sus vecinos'],
        correctIndex: 2, // C
        hint: 'Job reconoció que Dios es el dueño de todo lo que existe.',
      ),
      const QuizQuestion(
        question: '¿Qué le sugirió su esposa cuando Job perdió la salud?',
        options: ['A) Que orara más', 'B) Que buscara un médico', 'C) "Maldice a Dios, y muérete"', 'D) Que fuera a dormir'],
        correctIndex: 2, // C
        hint: 'Ella representaba la desesperación humana ante el dolor sin sentido.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el error principal de los tres amigos de Job?',
        options: ['A) Que no le llevaron comida', 'B) Que afirmaban que Job sufría porque era un pecador hipócrita', 'C) Que no hablaron con él', 'D) Que le robaron lo poco que le quedaba'],
        correctIndex: 1, // B
        hint: 'Aplicaron una teología de "causa y efecto" simplista.',
      ),
      const QuizQuestion(
        question: '¿Qué respondió Job ante la idea de solo recibir cosas buenas de Dios?',
        options: ['A) "¿Recibiremos el bien, y el mal no lo recibiremos?"', 'B) "Dios solo da cosas buenas"', 'C) "Voy a pedirle una explicación"', 'D) "Ya no quiero ser fiel"'],
        correctIndex: 0, // A
        hint: 'Aceptó la soberanía de Dios tanto en la abundancia como en la carencia.',
      ),
      const QuizQuestion(
        question: '¿Qué argumento usó Dios cuando finalmente le habló a Job?',
        options: ['A) Le pidió perdón', 'B) Le mostró Su sabiduría en la creación que Job no podía comprender', 'C) Le explicó los planes de Satanás', 'D) Le prometió dinero'],
        correctIndex: 1, // B
        hint: 'Dios le hizo preguntas sobre el universo que Job no podía responder.',
      ),
      const QuizQuestion(
        question: '¿Qué significa la frase "De oídas te había oído; mas ahora mis ojos te ven"?',
        options: ['A) Que Job estaba ciego', 'B) Que su relación con Dios pasó de ser teoría a una experiencia personal profunda', 'C) Que Dios se le apareció físicamente', 'D) Que recuperó la vista'],
        correctIndex: 1, // B
        hint: 'La prueba purificó su conocimiento espiritual.',
      ),
      const QuizQuestion(
        question: '¿Cómo termina la historia de Job respecto a sus posesiones?',
        options: ['A) Murió en la pobreza', 'B) Dios le devolvió el doble de lo que tenía antes', 'C) Se fue a vivir a otro país', 'D) No se menciona'],
        correctIndex: 1, // B
        hint: 'Fue restaurado después de que oró por sus amigos.',
      ),
      const QuizQuestion(
        question: '¿Qué cualidad de Job destaca el libro por encima de todo?',
        options: ['A) Su fuerza', 'B) Su riqueza', 'C) Su integridad y paciencia', 'D) Su elocuencia'],
        correctIndex: 2, // C
        hint: 'Santiago 5:11 dice: "Habéis oído de la paciencia de Job".',
      ),
      const QuizQuestion(
        question: '¿Qué reconoció Job sobre los planes de Dios en el capítulo 42?',
        options: ['A) Que Dios se equivoca', 'B) Que no hay pensamiento que se esconda de Él y que todo lo puede', 'C) Que Dios es lejano', 'D) Que el mal es más fuerte'],
        correctIndex: 1, // B
        hint: 'Es una confesión de la omnipotencia divina.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la lección teológica central del libro?',
        options: ['A) Que el pecado siempre trae enfermedad', 'B) Que Dios es soberano y confiable incluso cuando no entendemos el sufrimiento', 'C) Que los amigos siempre tienen la razón', 'D) Que hay que ser rico para ser fiel'],
        correctIndex: 1, // B
        hint: 'El enfoque está en quién es Dios, no en el porqué del dolor.',
      ),
    ],
  ),
  26: LessonData(
    id: 26,
    title: 'El Concilio de Jerusalén',
    biblicalReference: 'Hechos 15:1-2, 10-11, 19 (RVR1960)',
    biblicalText:
        '"Entonces algunos... enseñaban a los hermanos: Si no os circuncidáis conforme al rito de Moisés, no podéis ser salvos. [...] Ahora, pues, ¿por qué tentáis a Dios, poniendo sobre la cerviz de los discípulos un yugo que ni nuestros padres ni nosotros hemos podido llevar? Antes creemos que por la gracia del Señor Jesús seremos salvos, de igual modo que ellos. [...] Por lo cual yo juzgo que no se inquiete a los gentiles que se convierten a Dios."',
    explanation:
        'Este fue el primer gran conflicto doctrinal de la Iglesia. Algunos creyentes de origen judío insistían en que los nuevos cristianos (gentiles) debían seguir la Ley de Moisés y circuncidarse para ser salvos. Pablo, Bernabé, Pedro y Jacobo se reunieron en Jerusalén para decidir. La conclusión fue histórica: la salvación es solo por gracia a través de la fe, y añadir requisitos legales de la Antigua Alianza era "tentar a Dios". Esta decisión separó definitivamente al cristianismo del judaísmo legalista y permitió la expansión mundial del evangelio.',
    questions: [
      const QuizQuestion(
        question: '¿Cuál era la disputa principal que causó el Concilio de Jerusalén?',
        options: ['A) Quién sería el nuevo líder', 'B) Si los gentiles debían circuncidarse y guardar la Ley de Moisés para ser salvos', 'C) El dinero de las ofrendas', 'D) Dónde construir iglesias'],
        correctIndex: 1, // B
        hint: 'Era una lucha entre la ley y la gracia.',
      ),
      const QuizQuestion(
        question: '¿Quiénes se oponían a Pablo y Bernabé en Antioquía?',
        options: ['A) Los romanos', 'B) Algunos que venían de Judea y enseñaban ritos antiguos', 'C) Los filósofos griegos', 'D) Los discípulos de Juan el Bautista'],
        correctIndex: 1, // B
        hint: 'Eran personas con trasfondo judío estricto.',
      ),
      const QuizQuestion(
        question: '¿Cómo llamó Pedro a la exigencia de cumplir toda la Ley?',
        options: ['A) Un honor', 'B) Un yugo que ni sus padres ni ellos pudieron llevar', 'C) El camino a la santidad', 'D) Una sugerencia útil'],
        correctIndex: 1, // B
        hint: 'Un "yugo" es una carga pesada que cansa al que la lleva.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la conclusión de Pedro sobre cómo somos salvos (v. 11)?',
        options: ['A) Por portarnos bien', 'B) Por la gracia del Señor Jesús', 'C) Por nacer en Israel', 'D) Por hacer sacrificios'],
        correctIndex: 1, // B
        hint: 'Pedro defendió que tanto judíos como gentiles se salvan igual: por gracia.',
      ),
      const QuizQuestion(
        question: '¿Quién dio el juicio final o la propuesta de paz en el Concilio?',
        options: ['A) Pablo', 'B) Pedro', 'C) Jacobo (Santiago)', 'D) Juan'],
        correctIndex: 2, // C
        hint: 'Era el líder de la iglesia en Jerusalén en ese momento.',
      ),
      const QuizQuestion(
        question: '¿Qué decidió el Concilio respecto a los gentiles que se convertían?',
        options: ['A) Que debían hacerse judíos primero', 'B) Que no se les inquietara con cargas innecesarias de la ley', 'C) Que debían pagar un impuesto', 'D) Que no podían ser cristianos'],
        correctIndex: 1, // B
        hint: 'Se buscó no poner obstáculos al evangelio.',
      ),
      const QuizQuestion(
        question: '¿Cuáles fueron las pocas recomendaciones prácticas que sí les pidieron evitar?',
        options: ['A) Comer carne de cerdo', 'B) Lo sacrificado a ídolos, sangre, ahogado y fornicación', 'C) Hablar otros idiomas', 'D) Viajar en sábado'],
        correctIndex: 1, // B
        hint: 'Eran cosas que ayudaban a la convivencia con los hermanos judíos.',
      ),
      const QuizQuestion(
        question: '¿Por qué este evento es crucial para la historia del cristianismo?',
        options: ['A) Porque se mudaron a Roma', 'B) Porque confirmó que la salvación es por fe y no por obras de la ley', 'C) Porque eligieron un nuevo Papa', 'D) Porque terminó la persecución'],
        correctIndex: 1, // B
        hint: 'Definió la identidad de la Iglesia como universal y no solo judía.',
      ),
      const QuizQuestion(
        question: '¿A qué ciudad fueron enviados Pablo y Bernabé para resolver el problema?',
        options: ['A) Roma', 'B) Jerusalén', 'C) Éfeso', 'D) Corinto'],
        correctIndex: 1, // B
        hint: 'Allí estaban los apóstoles y ancianos principales.',
      ),
      const QuizQuestion(
        question: '¿Qué significa "tentar a Dios" en este contexto según Pedro?',
        options: ['A) Hacer milagros', 'B) Imponer reglas humanas que Dios no pidió para la salvación', 'C) Orar mucho', 'D) Ayunar sin hambre'],
        correctIndex: 1, // B
        hint: 'Es tratar de corregir el plan de gracia que Dios ya estableció.',
      ),
    ],
  ),
  27: LessonData(
    id: 27,
    title: 'Melquisedec y el Sacerdocio Superior',
    biblicalReference: 'Génesis 14:18-20; Hebreos 7:1-3, 15-17 (RVR1960)',
    biblicalText:
        '"Entonces Melquisedec, rey de Salem y sacerdote del Dios Altísimo, sacó pan y vino... y le bendijo, diciendo: Bendito sea Abram... [...] Porque este Melquisedec... de quien no hay genealogía; que ni tiene principio de días, ni fin de vida... permanece sacerdote para siempre. [...] Y esto es aun más manifiesto, si a semejanza de Melquisedec se levanta un sacerdote distinto, no constituido conforme a la ley del mandamiento carnal, sino según el poder de una vida indestructible. Pues se da testimonio de él: Tú eres sacerdote para siempre, según el orden de Melquisedec."',
    explanation:
        'Melquisedec es uno de los personajes más misteriosos de la Biblia. Aparece brevemente ante Abraham siglos antes de que existiera el sacerdocio de Aarón (levítico). El autor de Hebreos explica que Melquisedec es un "tipo" o figura de Cristo. A diferencia de los sacerdotes levitas que morían y necesitaban sucesores, Jesús tiene un sacerdocio superior porque no se basa en su linaje familiar (carne), sino en Su vida eterna. Jesús es Rey y Sacerdote al mismo tiempo, tal como lo era Melquisedec.',
    questions: [
      const QuizQuestion(
        question: '¿Qué dos títulos ostentaba Melquisedec simultáneamente?',
        options: ['A) Profeta y Juez', 'B) Rey de Salem y Sacerdote del Dios Altísimo', 'C) General y Escriba', 'D) Pastor y Pescador'],
        correctIndex: 1, // B
        hint: 'Representa una autoridad civil y espiritual unida.',
      ),
      const QuizQuestion(
        question: '¿Qué elementos llevó Melquisedec a Abraham (Abram)?',
        options: ['A) Oro y plata', 'B) Pan y vino', 'C) Una espada y un escudo', 'D) Agua y miel'],
        correctIndex: 1, // B
        hint: 'Son los mismos elementos que Jesús usó en la Santa Cena.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que Melquisedec no tenga "genealogía" en el relato bíblico?',
        options: ['A) Que era un ángel', 'B) Que su origen y final no fueron registrados para simbolizar la eternidad', 'C) Que no tenía padres', 'D) Que era un fantasma'],
        correctIndex: 1, // B
        hint: 'Es una figura literaria para representar el sacerdocio eterno de Cristo.',
      ),
      const QuizQuestion(
        question: '¿A qué orden sacerdotal pertenece Jesucristo según Hebreos?',
        options: ['A) Al orden de Aarón', 'B) Al orden de Melquisedec', 'C) Al orden de los Levitas', 'D) Al orden de David'],
        correctIndex: 1, // B
        hint: 'Es un orden anterior y superior al de la Ley de Moisés.',
      ),
      const QuizQuestion(
        question: '¿Por qué el sacerdocio de Jesús es superior al de los levitas?',
        options: ['A) Porque Jesús era más rico', 'B) Porque se basa en una vida indestructible y no en la muerte', 'C) Porque Jesús vivía en Jerusalén', 'D) Porque los levitas no oraban'],
        correctIndex: 1, // B
        hint: 'Los sacerdotes humanos morían, pero Jesús vive para siempre para interceder.',
      ),
      const QuizQuestion(
        question: '¿Qué le entregó Abraham a Melquisedec en señal de reconocimiento?',
        options: ['A) Sus armas', 'B) Los diezmos de todo el botín', 'C) Una carta de recomendación', 'D) Su túnica'],
        correctIndex: 1, // B
        hint: 'Reconoció que Melquisedec era superior a él espiritualmente.',
      ),
      const QuizQuestion(
        question: '¿Qué significa el nombre "Melquisedec"?',
        options: ['A) Rey de Justicia', 'B) Hombre fuerte', 'C) Dios es grande', 'D) Amigo de Dios'],
        correctIndex: 0, // A
        hint: 'Proviene de las palabras hebreas \'Melek\' (Rey) y \'Tsedek\' (Justicia).',
      ),
      const QuizQuestion(
        question: '¿Qué ciudad gobernaba Melquisedec ( Salem)?',
        options: ['A) Babilonia', 'B) Salem (que significa Paz, futura Jerusalén)', 'C) Ur', 'D) Jericó'],
        correctIndex: 1, // B
        hint: 'Salem es la raíz de la palabra Shalom.',
      ),
      const QuizQuestion(
        question: '¿Según qué "poder" fue constituido Jesús como sacerdote?',
        options: ['A) El poder de la política', 'B) El poder de una vida indestructible', 'C) El poder de los milagros', 'D) El poder del pueblo'],
        correctIndex: 1, // B
        hint: 'Su resurrección validó Su sacerdocio eterno.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la función principal de este sacerdocio eterno en el cielo?',
        options: ['A) Juzgar al mundo hoy', 'B) Interceder por los que se acercan a Dios por medio de Él', 'C) Construir templos', 'D) Escribir leyes'],
        correctIndex: 1, // B
        hint: 'Él está ante el Padre a favor de nosotros.',
      ),
    ],
  ),
  28: LessonData(
    id: 28,
    title: 'La Visión de los Huesos Secos',
    biblicalReference: 'Ezequiel 37:1-5, 11-12 (RVR1960)',
    biblicalText:
        '"La mano de Jehová vino sobre mí... y me puso en medio de un valle que estaba lleno de huesos. [...] Y me dijo: Hijo de hombre, ¿vivirán estos huesos? Y dije: Señor Jehová, tú lo sabes. [...] Así ha dicho Jehová el Señor a estos huesos: He aquí, yo hago entrar espíritu en vosotros, y viviréis. [...] Me dijo luego: Hijo de hombre, todos estos huesos son la casa de Israel. He aquí, ellos dicen: Nuestros huesos se secaron, y pereció nuestra esperanza... Por tanto, profetiza... He aquí yo abro vuestros sepulcros, pueblo mío, y os haré subir de vuestros sepulcros."',
    explanation:
        'Ezequiel recibió esta visión mientras Israel estaba en el exilio, sintiéndose como una nación muerta y sin esperanza. Los huesos secos representan la condición espiritual y nacional de Israel: totalmente sin vida. El nivel difícil aquí es entender la teología de la Restauración Soberana. Dios no solo une los huesos y les da carne, sino que sopla Su Ruaj (Espíritu/Aliento) para darles vida. Es una profecía de doble cumplimiento: el regreso físico a su tierra y la futura regeneración espiritual de Israel y de todo creyente que está muerto en pecados.',
    questions: [
      const QuizQuestion(
        question: '¿Qué representaban los "huesos secos" en la visión de Ezequiel?',
        options: ['A) Un cementerio antiguo', 'B) La casa de Israel en su estado de desesperanza y muerte espiritual', 'C) Un ejército enemigo derrotado', 'D) El fin del mundo físico'],
        correctIndex: 1, // B
        hint: 'Representaban a un pueblo que decía: "nuestra esperanza pereció".',
      ),
      const QuizQuestion(
        question: '¿Qué pregunta le hizo Dios a Ezequiel sobre los huesos?',
        options: ['A) "¿Cuántos huesos hay?"', 'B) "¿Hijo de hombre, vivirán estos huesos?"', 'C) "¿Quién mató a estas personas?"', 'D) "¿Quieres irte de aquí?"'],
        correctIndex: 1, // B
        hint: 'Dios probó la fe y el reconocimiento de Ezequiel sobre Su poder.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la respuesta de Ezequiel ante la pregunta de Dios?',
        options: ['A) "No, es imposible"', 'B) "Señor Jehová, tú lo sabes"', 'C) "Sí, yo los resucitaré"', 'D) No respondió nada'],
        correctIndex: 1, // B
        hint: 'Fue una respuesta de humildad, reconociendo que solo Dios tiene la última palabra.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedió primero cuando Ezequiel profetizó sobre los huesos?',
        options: ['A) Empezaron a volar', 'B) Hubo un ruido y un temblor, y los huesos se juntaron cada uno con su hueso', 'C) Se convirtieron en polvo', 'D) Aparecieron ángeles'],
        correctIndex: 1, // B
        hint: 'Hubo un ordenamiento lógico y estructural antes de la vida.',
      ),
      const QuizQuestion(
        question: '¿Qué les faltaba a los cuerpos después de tener tendones, carne y piel?',
        options: ['A) Ropa', 'B) Aliento (espíritu) de vida', 'C) Armas para pelear', 'D) Comida'],
        correctIndex: 1, // B
        hint: 'El cuerpo físico estaba completo, pero seguía inanimado.',
      ),
      const QuizQuestion(
        question: '¿Desde dónde mandó Dios llamar al "aliento" o espíritu?',
        options: ['A) Del cielo solamente', 'B) De los cuatro vientos', 'C) De la tierra', 'D) Del mar'],
        correctIndex: 1, // B
        hint: 'Representa la omnipresencia del Espíritu de Dios en toda la creación.',
      ),
      const QuizQuestion(
        question: '¿En qué se convirtieron los huesos una vez que recibieron vida?',
        options: ['A) En una multitud de niños', 'B) En un ejército grande en extremo', 'C) En estatuas de oro', 'D) En sacerdotes'],
        correctIndex: 1, // B
        hint: 'Indica que la restauración es para la acción y el propósito de Dios.',
      ),
      const QuizQuestion(
        question: '¿Qué frase usaba el pueblo de Israel para describir su situación (v. 11)?',
        options: ['A) "Somos muy fuertes"', 'B) "Nuestros huesos se secaron, y pereció nuestra esperanza"', 'C) "Dios nos ha olvidado para siempre"', 'D) "Queremos volver a Egipto"'],
        correctIndex: 1, // B
        hint: 'Era una expresión de desolación total.',
      ),
      const QuizQuestion(
        question: '¿Qué promesa de resurrección nacional da Dios en el v. 12?',
        options: ['A) "Construiré nuevas casas"', 'B) "Yo abro vuestros sepulcros... y os haré subir de ellos"', 'C) "Les daré mucho oro"', 'D) "Olvidarán el pasado"'],
        correctIndex: 1, // B
        hint: 'Dios promete sacar al pueblo de su "tumba" de cautiverio y muerte.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el significado espiritual profundo de esta visión para hoy?',
        options: ['A) Que debemos estudiar medicina', 'B) Que Dios puede dar vida espiritual a lo que parece totalmente muerto y perdido', 'C) Que los huesos son importantes', 'D) Que Ezequiel era un gran orador'],
        correctIndex: 1, // B
        hint: 'Se aplica a la regeneración del alma por el Espíritu Santo.',
      ),
    ],
  ),
  29: LessonData(
    id: 29,
    title: 'El Sacrificio de Isaac',
    biblicalReference: 'Génesis 22:1-2, 9-13 (RVR1960)',
    biblicalText:
        '"Aconteció que probó Dios a Abraham, y le dijo: ... Toma ahora a tu hijo, tu único, Isaac, a quien amas... y ofreciólo allí en holocausto. [...] Y cuando llegaron al lugar... edificó allí Abraham un altar... y ató a Isaac su hijo, y lo puso en el altar. [...] Entonces el ángel de Jehová le dio voces... No extiendas tu mano sobre el muchacho... porque ya conozco que temes a Dios. [...] Entonces alzó Abraham sus ojos y miró, y he aquí a sus espaldas un carnero trabado en un zarzal... y ofreció al carnero en holocausto en lugar de su hijo."',
    explanation:
        'Este relato, conocido como la Akedah (atadura), es una de las pruebas de fe más difíciles de la Biblia. Dios le pide a Abraham que sacrifique al hijo de la promesa. El nivel difícil reside en entender la tipología: Isaac cargando la leña para su propio sacrificio es una figura de Jesús cargando la cruz. Abraham creía que Dios podía resucitar a Isaac si era necesario (Hebreos 11:19). Al final, Dios provee un sustituto (el carnero), enseñando que Él mismo proveería el Cordero definitivo para la humanidad.',
    questions: [
      const QuizQuestion(
        question: '¿Qué palabra usa el texto para describir lo que Dios estaba haciendo con Abraham?',
        options: ['A) Castigando', 'B) Probando', 'C) Jugando', 'D) Engañando'],
        correctIndex: 1, // B
        hint: 'Dios quería demostrar la profundidad de la fe y obediencia de Abraham.',
      ),
      const QuizQuestion(
        question: '¿Cómo describe Dios a Isaac en su petición inicial?',
        options: ['A) "Tu hijo más inteligente"', 'B) "Tu hijo, tu único, a quien amas"', 'C) "El futuro rey"', 'D) "Un muchacho rebelde"'],
        correctIndex: 1, // B
        hint: 'Enfatiza el valor emocional y la importancia de la promesa que Isaac representaba.',
      ),
      const QuizQuestion(
        question: '¿Qué cargó Isaac mientras subían al monte Moriah?',
        options: ['A) El agua', 'B) La leña para el holocausto', 'C) Un cordero', 'D) Las provisiones'],
        correctIndex: 1, // B
        hint: 'Es una imagen profética de Cristo cargando el madero.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue la respuesta de Abraham cuando Isaac preguntó: "¿Dónde está el cordero?"?',
        options: ['A) "Lo hemos olvidado"', 'B) "Dios se proveerá de cordero para el holocausto"', 'C) "Tú eres el cordero"', 'D) "Pronto llegará"'],
        correctIndex: 1, // B
        hint: 'Demuestra una confianza absoluta en la provisión divina.',
      ),
      const QuizQuestion(
        question: '¿Qué impidió que Abraham sacrificara finalmente a su hijo?',
        options: ['A) Que Isaac escapó', 'B) La voz del Ángel de Jehová que le ordenó detenerse', 'C) Que Abraham se arrepintió', 'D) Que empezó a llover'],
        correctIndex: 1, // B
        hint: 'Dios intervino en el momento exacto en que Abraham demostró su disposición total.',
      ),
      const QuizQuestion(
        question: '¿Qué animal proveyó Dios como sustituto de Isaac?',
        options: ['A) Una paloma', 'B) Un carnero trabado en un zarzal', 'C) Un buey', 'D) Un león'],
        correctIndex: 1, // B
        hint: 'Estaba justo detrás de Abraham, listo para el sacrificio.',
      ),
      const QuizQuestion(
        question: '¿Qué significa el nombre que Abraham le puso a aquel lugar?',
        options: ['A) "El monte del dolor"', 'B) "Jehová Jireh" (Jehová proveerá)', 'C) "La casa de Dios"', 'D) "Lugar de la fe"'],
        correctIndex: 1, // B
        hint: 'Es uno de los nombres compuestos de Dios que revela Su carácter.',
      ),
      const QuizQuestion(
        question: 'Según Hebreos 11:19, ¿qué pensaba Abraham que Dios podía hacer con Isaac?',
        options: ['A) Olvidarlo', 'B) Resucitarlo de entre los muertos', 'C) Cambiarlo por otro hijo', 'D) Salvarlo por medio de ángeles'],
        correctIndex: 1, // B
        hint: 'Su fe se basaba en que Dios no puede romper Su promesa de descendencia.',
      ),
      const QuizQuestion(
        question: '¿Por qué Isaac no se resistió al ser atado (considerando que Abraham era muy anciano)?',
        options: ['A) Porque estaba dormido', 'B) Porque también tenía fe y obedeció la voluntad de su padre y de Dios', 'C) Porque no sabía qué pasaba', 'D) Porque estaba amarrado muy fuerte'],
        correctIndex: 1, // B
        hint: 'Representa la sumisión voluntaria de Cristo al Padre.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la conexión principal de esta historia con el Nuevo Testamento?',
        options: ['A) Que no hay que viajar a los montes', 'B) Que Dios Padre entregó a Su único Hijo Jesús como el sacrificio definitivo', 'C) Que los carneros son sagrados', 'D) Que Abraham era un hombre rico'],
        correctIndex: 1, // B
        hint: 'Isaac fue "salvado" por un sustituto; nosotros somos salvados por Cristo.',
      ),
    ],
  ),
  30: LessonData(
    id: 30,
    title: 'La Vision de la Estatua de Nabucodonosor',
    biblicalReference: 'Daniel 2:31-35, 44 (RVR1960)',
    biblicalText:
        '"Tú, oh rey, veías... una gran imagen. Su cabeza era de oro fino; su pecho y sus brazos, de plata; su vientre y sus muslos, de bronce; sus piernas, de hierro; sus pies, en parte de hierro y en parte de barro cocido. [...] Estabas mirando, hasta que una piedra fue cortada, no con mano, e hirió a la imagen en sus pies... y la imagen fue desmenuzada... Mas la piedra que hirió a la imagen fue hecha un gran monte que llenó toda la tierra. [...] Y en los días de estos reyes el Dios del cielo levantará un reino que no será jamás destruido."',
    explanation:
        'El rey Nabucodonosor tuvo un sueño que solo Daniel pudo interpretar por revelación divina. La estatua representa la sucesión de los imperios mundiales: Babilonia (oro), Medo-Persia (plata), Grecia (bronce) y Roma (hierro). Los pies de hierro y barro representan la división final de los reinos humanos. El nivel difícil es entender la Escatología (eventos finales): la "piedra cortada no con mano" es el Reino de Dios (Cristo), que destruirá todo sistema humano y establecerá un reino eterno que llenará la tierra.',
    questions: [
      const QuizQuestion(
        question: '¿De qué material era la cabeza de la estatua y a qué reino representaba?',
        options: ['A) De plata (Medo-Persia)', 'B) De oro fino (Babilonia)', 'C) De bronce (Grecia)', 'D) De hierro (Roma)'],
        correctIndex: 1, // B
        hint: 'Daniel le dijo al rey: "Tú eres aquella cabeza de oro".',
      ),
      const QuizQuestion(
        question: '¿Qué representaba el pecho y los brazos de plata?',
        options: ['A) Un reino inferior al de Babilonia (Medo-Persia)', 'B) El reino de los cielos', 'C) Egipto', 'D) La iglesia'],
        correctIndex: 0, // A
        hint: 'Cada material hacia abajo es menos valioso pero más duro.',
      ),
      const QuizQuestion(
        question: '¿Qué característica especial tenían los pies de la imagen?',
        options: ['A) Eran de oro puro', 'B) Eran una mezcla de hierro (fuerza) y barro cocido (fragilidad)', 'C) Eran invisibles', 'D) Eran muy pequeños'],
        correctIndex: 1, // B
        hint: 'Representan un tiempo de división y falta de cohesión entre los reinos.',
      ),
      const QuizQuestion(
        question: '¿Qué destruyó finalmente a la gran estatua?',
        options: ['A) Un terremoto', 'B) Una piedra cortada, no con mano', 'C) El viento del desierto', 'D) El ejército de Daniel'],
        correctIndex: 1, // B
        hint: 'No fue una obra humana, sino una intervención divina.',
      ),
      const QuizQuestion(
        question: '¿Dónde golpeó la piedra a la estatua?',
        options: ['A) En la cabeza de oro', 'B) En los pies de hierro y barro', 'C) En el pecho de plata', 'D) En el vientre de bronce'],
        correctIndex: 1, // B
        hint: 'El golpe fue en la base, provocando el colapso de toda la estructura.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedió con la piedra después de destruir la estatua?',
        options: ['A) Desapareció', 'B) Se rompió en mil pedazos', 'C) Fue hecha un gran monte que llenó toda la tierra', 'D) Se convirtió en oro'],
        correctIndex: 2, // C
        hint: 'Representa el crecimiento del Reino de Dios hasta cubrir el mundo.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que la piedra fue cortada "no con mano"?',
        options: ['A) Que fue un accidente', 'B) Que su origen es divino y no humano', 'C) Que Daniel la talló', 'D) Que era una piedra natural del campo'],
        correctIndex: 1, // B
        hint: 'Se refiere al Reino que el Dios del cielo levantará.',
      ),
      const QuizQuestion(
        question: '¿Qué pasará con el reino representado por la piedra según el v. 44?',
        options: ['A) Será conquistado por otro', 'B) Durará mil años', 'C) No será jamás destruido y permanecerá para siempre', 'D) Será solo para los judíos'],
        correctIndex: 2, // C
        hint: 'Es el Reino eterno de Jesucristo.',
      ),
      const QuizQuestion(
        question: '¿Qué representan los diversos metales en orden descendente?',
        options: ['A) El aumento de la santidad', 'B) La sucesión cronológica de los imperios mundiales', 'C) La evolución del hombre', 'D) Las estaciones del año'],
        correctIndex: 1, // B
        hint: 'Daniel explica el futuro político de la humanidad desde su tiempo.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la lección central sobre el poder humano en esta visión?',
        options: ['A) Que el oro es lo más importante', 'B) Que todos los reinos humanos son temporales y serán reemplazados por el Reino de Dios', 'C) Que Nabucodonosor fue el mejor rey', 'D) Que hay que saber interpretar sueños'],
        correctIndex: 1, // B
        hint: 'Muestra la soberanía de Dios sobre la historia humana.',
      ),
    ],
  ),
  31: LessonData(
    id: 31,
    title: 'La Naturaleza de la Deidad (La Trinidad)',
    biblicalReference: 'Mateo 3:16-17; Juan 1:1, 14; 2 Corintios 13:14 (RVR1960)',
    biblicalText:
        '"Y Jesús, después que fue bautizado, subió luego del agua; y he aquí los cielos le fueron abiertos, y vio al Espíritu de Dios que descendía como paloma y venía sobre él. Y hubo una voz de los cielos, que decía: Este es mi Hijo amado... [...] En el principio era el Verbo, y el Verbo era con Dios, y el Verbo era Dios. Y aquel Verbo fue hecho carne... [...] La gracia del Señor Jesucristo, el amor de Dios, y la comunión del Espíritu Santo sean con todos vosotros."',
    explanation:
        'La doctrina de la Trinidad enseña que hay un solo Dios que existe eternamente en tres Personas distintas: el Padre, el Hijo y el Espíritu Santo. No son tres dioses, sino una sola esencia. En el bautismo de Jesús, vemos a las tres Personas manifestadas simultáneamente: el Padre habla desde el cielo, el Hijo es bautizado en la tierra y el Espíritu desciende sobre Él. Juan 1:1 confirma la deidad de Cristo (el Verbo) como eterno y creador, mientras que la bendición apostólica de Pablo muestra la igualdad y relación entre las tres Personas en la vida del creyente.',
    questions: [
      const QuizQuestion(
        question: '¿Qué evento muestra a las tres Personas de la Trinidad manifestadas al mismo tiempo?',
        options: ['A) La creación', 'B) El bautismo de Jesús', 'C) La última cena', 'D) La crucifixión'],
        correctIndex: 1, // B
        hint: 'Se escucha al Padre, se ve al Hijo y desciende el Espíritu.',
      ),
      const QuizQuestion(
        question: '¿Qué afirma Juan 1:1 sobre la relación entre el "Verbo" y Dios?',
        options: ['A) Que el Verbo fue creado por Dios', 'B) Que el Verbo era con Dios y el Verbo era Dios', 'C) Que el Verbo era un ángel', 'D) Que no tenían relación'],
        correctIndex: 1, // B
        hint: 'Establece la coexistencia eterna y la misma esencia divina.',
      ),
      const QuizQuestion(
        question: '¿A quién se refiere el término "El Verbo" en el capítulo 1 de Juan?',
        options: ['A) A Moisés', 'B) A Jesucristo hecho carne', 'C) A la Biblia física', 'D) A un profeta desconocido'],
        correctIndex: 1, // B
        hint: 'Es quien "habitó entre nosotros" y vimos Su gloria.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la fórmula de bendición que usa Pablo en 2 Corintios 13:14?',
        options: ['A) Solo el amor de Dios', 'B) La gracia de Jesús, el amor de Dios y la comunión del Espíritu Santo', 'C) El poder del hombre', 'D) La suerte del mundo'],
        correctIndex: 1, // B
        hint: 'Menciona a las tres Personas en un mismo nivel de importancia.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que las tres Personas sean de una misma "esencia" o "sustancia"?',
        options: ['A) Que son tres cuerpos iguales', 'B) Que comparten la misma naturaleza divina única', 'C) Que son tres nombres para una sola persona', 'D) Que son materiales diferentes'],
        correctIndex: 1, // B
        hint: 'Es la distinción entre "quién" (Persona) y "qué" (Ser).',
      ),
      const QuizQuestion(
        question: '¿Qué rol cumplió el Padre en el bautismo según el texto de Mateo?',
        options: ['A) Fue bautizado con Jesús', 'B) Dio testimonio desde el cielo diciendo: "Este es mi Hijo amado"', 'C) Se convirtió en paloma', 'D) No apareció'],
        correctIndex: 1, // B
        hint: 'Su voz validó la identidad del Hijo.',
      ),
      const QuizQuestion(
        question: '¿Cómo descendió el Espíritu Santo sobre Jesús?',
        options: ['A) Como fuego', 'B) Como una paloma', 'C) Como un viento fuerte', 'D) Como agua'],
        correctIndex: 1, // B
        hint: 'Fue una manifestación visible de la unción de Dios sobre el Mesías.',
      ),
      const QuizQuestion(
        question: '¿Qué implica el término "Eternamente" aplicado a la Trinidad?',
        options: ['A) Que Dios nació hace mucho tiempo', 'B) Que nunca hubo un tiempo donde alguna de las tres Personas no existiera', 'C) Que vivirán mucho tiempo', 'D) Que son parte del tiempo'],
        correctIndex: 1, // B
        hint: 'Dios está fuera del tiempo; es el "Yo Soy".',
      ),
      const QuizQuestion(
        question: '¿Por qué la Trinidad es fundamental para la salvación?',
        options: ['A) Porque así hay más personas ayudando', 'B) Porque el Padre envía, el Hijo rescata y el Espíritu sella al creyente', 'C) Porque es una regla del templo', 'D) No es importante'],
        correctIndex: 1, // B
        hint: 'Cada Persona tiene un rol en el plan de redención.',
      ),
      const QuizQuestion(
        question: '¿Es la palabra "Trinidad" mencionada textualmente en la Biblia?',
        options: ['A) Sí, en muchos versículos', 'B) No, es un término teológico usado para describir la realidad revelada en los textos citados', 'C) Solo en el Antiguo Testamento', 'D) Solo la dijo Jesús'],
        correctIndex: 1, // B
        hint: 'Es un concepto derivado del estudio sistemático de las Escrituras.',
      ),
    ],
  ),
  32: LessonData(
    id: 32,
    title: 'La Kenosis (La Humillación de Cristo)',
    biblicalReference: 'Filipenses 2:5-8 (RVR1960)',
    biblicalText:
        '"Haya, pues, en vosotros este sentir que hubo también en Cristo Jesús, el cual, siendo en forma de Dios, no estimó el ser igual a Dios como cosa a que aferrarse, sino que se despojó a sí mismo, tomando forma de siervo, hecho semejante a los hombres; y estando en la condición de hombre, se humilló a sí mismo, haciéndose obediente hasta la muerte, y muerte de cruz."',
    explanation:
        'El concepto de Kenosis (del griego que significa "vaciamiento" o "despojo") se refiere a la encarnación de Jesús. No significa que Jesús dejó de ser Dios, sino que voluntariamente dejó de lado el uso de Sus atributos divinos independientes y Su gloria celestial para vivir como un hombre bajo la guía del Espíritu Santo. Pasó de la "forma de Dios" a la "forma de siervo". Esta es la máxima expresión de humildad: el Creador sometiéndose a las limitaciones humanas y a la muerte para salvar a Su creación.',
    questions: [
      const QuizQuestion(
        question: '¿Qué significa que Jesús no estimó el ser igual a Dios como "cosa a que aferrarse"?',
        options: ['A) Que no era igual a Dios', 'B) Que aunque era igual a Dios, no usó Su estatus para Su propio beneficio', 'C) Que quería ser más que Dios', 'D) Que perdió Su poder'],
        correctIndex: 1, // B
        hint: 'Fue un acto de renuncia voluntaria a privilegios.',
      ),
      const QuizQuestion(
        question: '¿Qué palabra teológica describe el acto de Jesús de "despojarse a sí mismo"?',
        options: ['A) Koinonía', 'B) Kenosis', 'C) Parusía', 'D) Apocalipsis'],
        correctIndex: 1, // B
        hint: 'Proviene del griego usado en el versículo 7.',
      ),
      const QuizQuestion(
        question: '¿A qué forma se rebajó el Señor de la gloria según el versículo 7?',
        options: ['A) Forma de ángel', 'B) Forma de siervo', 'C) Forma de rey terrenal', 'D) Forma de guerrero'],
        correctIndex: 1, // B
        hint: 'Eligió la posición más baja de servicio.',
      ),
      const QuizQuestion(
        question: '¿Qué implica que Jesús fuera "hecho semejante a los hombres"?',
        options: ['A) Que era un fantasma que parecía hombre', 'B) Que tomó una naturaleza humana real con todas sus limitaciones (hambre, cansancio, dolor)', 'C) Que solo se disfrazó de hombre', 'D) Que era un superhombre'],
        correctIndex: 1, // B
        hint: 'Experimentó la vida humana de forma genuina.',
      ),
      const QuizQuestion(
        question: '¿Cuál fue el nivel máximo de la humillación de Cristo según el versículo 8?',
        options: ['A) Vivir en la pobreza', 'B) La muerte, y específicamente la muerte de cruz', 'C) Ser insultado por los fariseos', 'D) Tener hambre en el desierto'],
        correctIndex: 1, // B
        hint: 'La cruz era la muerte más vergonzosa y dolorosa de la época.',
      ),
      const QuizQuestion(
        question: '¿Dejó Jesús de ser Dios durante Su tiempo en la tierra?',
        options: ['A) Sí, volvió a ser Dios tras la resurrección', 'B) No, Él era 100% Dios y 100% hombre (Unión Hipostática)', 'C) Era solo un hombre bueno', 'D) Era mitad Dios y mitad hombre'],
        correctIndex: 1, // B
        hint: 'La deidad no puede dejar de existir, solo se ocultó bajo la humanidad.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito de Pablo al mencionar esta doctrina en Filipenses?',
        options: ['A) Enseñarnos historia', 'B) Que tengamos el mismo sentir de humildad unos con otros', 'C) Que estudiemos griego', 'D) Explicar la ciencia de la creación'],
        correctIndex: 1, // B
        hint: 'Usa el ejemplo de Jesús como modelo de conducta cristiana.',
      ),
      const QuizQuestion(
        question: '¿Qué significa "forma de Dios" (Morphe Theou) en el contexto original?',
        options: ['A) Que se parecía a Dios', 'B) Que poseía la esencia y naturaleza interna de Dios mismo', 'C) Que tenía un cuerpo brillante', 'D) Que era un hijo de Dios más'],
        correctIndex: 1, // B
        hint: 'Se refiere a la naturaleza intrínseca del ser.',
      ),
      const QuizQuestion(
        question: '¿Ante quién se hizo obediente Jesús?',
        options: ['A) Ante el Imperio Romano', 'B) Ante Dios el Padre', 'C) Ante los apóstoles', 'D) Ante Sus propios deseos'],
        correctIndex: 1, // B
        hint: 'Su misión era cumplir la voluntad de Quien le envió.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedió después de este periodo de humillación (según los versículos siguientes)?',
        options: ['A) Dios lo olvidó', 'B) Dios lo exaltó hasta lo sumo y le dio un nombre sobre todo nombre', 'C) Se quedó en la tumba', 'D) Se hizo un ángel'],
        correctIndex: 1, // B
        hint: 'El camino a la gloria pasó primero por la cruz.',
      ),
    ],
  ),
  33: LessonData(
    id: 33,
    title: 'La Unión Hipostática (Las Dos Naturalezas de Cristo)',
    biblicalReference: 'Colosenses 2:9; 1 Timoteo 2:5; Hebreos 2:14, 17 (RVR1960)',
    biblicalText:
        '"Porque en él habita corporalmente toda la plenitud de la Deidad. [...] Porque hay un solo Dios, y un solo mediador entre Dios y los hombres, Jesucristo hombre. [...] Así que, por cuanto los hijos participaron de carne y sangre, él también participó de lo mismo... por lo cual debía ser en todo semejante a sus hermanos, para venir a ser misericordioso y fiel sumo sacerdote..."',
    explanation:
        'La Unión Hipostática es la doctrina que explica cómo en la persona de Jesucristo se unen dos naturalezas: la divina y la humana, sin mezclarse ni confundirse. Jesús es verdadero Dios y verdadero hombre. Era necesario que fuera hombre para poder morir en lugar de la humanidad y ser un mediador que entiende nuestras debilidades. Al mismo tiempo, era necesario que fuera Dios para que Su sacrificio tuviera un valor infinito y pudiera vencer a la muerte. No son dos personas en un cuerpo, sino una sola Persona con dos naturalezas perfectas.',
    questions: [
      const QuizQuestion(
        question: '¿Qué significa que en Cristo habita la "plenitud de la Deidad" corporalmente?',
        options: ['A) Que Dios le dio un poco de poder', 'B) Que todo lo que Dios es, está presente en el cuerpo físico de Jesús', 'C) Que Jesús es un templo vacío', 'D) Que Jesús es solo un símbolo de Dios'],
        correctIndex: 1, // B
        hint: 'Colosenses 2:9 no deja fuera ningún atributo divino.',
      ),
      const QuizQuestion(
        question: '¿Por qué Jesús es el único mediador válido entre Dios y los hombres?',
        options: ['A) Porque es muy sabio', 'B) Porque al ser Dios y hombre, puede representar perfectamente a ambas partes', 'C) Porque Él escribió la Biblia', 'D) Porque los ángeles están ocupados'],
        correctIndex: 1, // B
        hint: 'Un mediador debe conocer y pertenecer a ambos lados del conflicto.',
      ),
      const QuizQuestion(
        question: '¿Qué frase usa Pablo en 1 Timoteo 2:5 para enfatizar la humanidad de Jesús después de Su resurrección?',
        options: ['A) "Jesucristo el espíritu"', 'B) "Jesucristo hombre"', 'C) "Jesucristo el ángel"', 'D) "El profeta Jesús"'],
        correctIndex: 1, // B
        hint: 'Mantiene Su naturaleza humana glorificada incluso en el cielo.',
      ),
      const QuizQuestion(
        question: '¿Para qué participó Jesús de "carne y sangre" según Hebreos 2:14?',
        options: ['A) Para comer con los hombres', 'B) Para destruir por medio de la muerte al que tenía el imperio de la muerte (el diablo)', 'C) Para conocer el mundo', 'D) Para ser famoso'],
        correctIndex: 1, // B
        hint: 'La muerte era necesaria para la victoria, y solo un ser de carne puede morir.',
      ),
      const QuizQuestion(
        question: '¿Qué cualidad desarrolla Jesús al ser "en todo semejante a sus hermanos"?',
        options: ['A) Se vuelve impaciente', 'B) Viene a ser un sumo sacerdote misericordioso y fiel que se compadece de nuestras debilidades', 'C) Se vuelve pecador', 'D) Se cansa de nosotros'],
        correctIndex: 1, // B
        hint: 'Su experiencia humana le permite entendernos desde adentro.',
      ),
      const QuizQuestion(
        question: 'En la Unión Hipostática, ¿se mezclan las dos naturalezas para formar una nueva (como un color mezcla de otros)?',
        options: ['A) Sí, ahora es una naturaleza mixta', 'B) No, las naturalezas se mantienen distintas pero unidas en una sola Persona', 'C) Jesús perdió Su deidad', 'D) Jesús perdió Su humanidad'],
        correctIndex: 1, // B
        hint: 'Dios no puede dejar de ser Dios, y el hombre no puede dejar de ser hombre.',
      ),
      const QuizQuestion(
        question: '¿Cómo se manifiesta la naturaleza humana de Jesús en los evangelios?',
        options: ['A) Cuando tiene hambre, llora o duerme', 'B) Cuando camina sobre el agua', 'C) Cuando perdona pecados', 'D) Cuando conoce los pensamientos'],
        correctIndex: 0, // A
        hint: 'Son las limitaciones físicas naturales.',
      ),
      const QuizQuestion(
        question: '¿Cómo se manifiesta la naturaleza divina de Jesús en los evangelios?',
        options: ['A) Cuando come pescado', 'B) Cuando tiene autoridad sobre la vida, la muerte y el pecado', 'C) Cuando viaja en barca', 'D) Cuando ora al Padre'],
        correctIndex: 1, // B
        hint: 'Son actos que solo Dios puede realizar.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedería si Jesús no fuera 100% Dios?',
        options: ['A) Nada, seguiría siendo un buen maestro', 'B) Su sacrificio no tendría poder para salvar a toda la humanidad', 'C) Sería más simpático', 'D) No habría resucitado'],
        correctIndex: 1, // B
        hint: 'La salvación requiere un valor infinito que solo Dios posee.',
      ),
      const QuizQuestion(
        question: '¿Qué sucedería si Jesús no fuera 100% hombre?',
        options: ['A) Sería mejor', 'B) No podría haber muerto realmente en nuestro lugar como nuestro representante humano', 'C) No habría podido hablar', 'D) No habría venido a la tierra'],
        correctIndex: 1, // B
        hint: 'El sustituto del hombre debe ser un hombre.',
      ),
    ],
  ),
  34: LessonData(
    id: 34,
    title: 'La Regeneración y la Adopción (Soteriología)',
    biblicalReference: 'Juan 3:3-6; Romanos 8:14-17; Efesios 2:4-5 (RVR1960)',
    biblicalText:
        '"Respondió Jesús y le dijo: De cierto, de cierto te digo, que el que no naciere de nuevo, no puede ver el reino de Dios. [...] Lo que es nacido de la carne, carne es; y lo que es nacido del Espíritu, espíritu es. [...] Pues no habéis recibido el espíritu de esclavitud para estar otra vez en temor, sino que habéis recibido el espíritu de adopción, por el cual clamamos: ¡Abba, Padre! [...] Y si hijos, también herederos; herederos de Dios y coherederos con Cristo."',
    explanation:
        'La salvación implica dos cambios jurídicos y espirituales profundos: la Regeneración y la Adopción. La regeneración (el "nuevo nacimiento") es el acto del Espíritu Santo que imparte vida espiritual a un corazón muerto en pecado, permitiéndole creer y arrepentirse. La adopción es el acto legal por el cual Dios nos recibe en Su familia. Ya no somos solo criaturas, sino hijos con derechos de herencia. "Abba" es un término arameo íntimo (parecido a "Papá"), que refleja la cercanía que ahora tenemos con el Creador.',
    questions: [
      const QuizQuestion(
        question: '¿Qué término usó Jesús con Nicodemo para explicar la entrada al Reino?',
        options: ['A) Ser muy bueno', 'B) Nacer de nuevo', 'C) Estudiar la ley', 'D) Ser bautizado en agua solamente'],
        correctIndex: 1, // B
        hint: 'Es un cambio de naturaleza interna.',
      ),
      const QuizQuestion(
        question: '¿Quién es el agente que produce la regeneración según Juan 3?',
        options: ['A) El hombre mismo', 'B) El Espíritu Santo', 'C) Los padres', 'D) El sacerdote'],
        correctIndex: 1, // B
        hint: 'Lo que es nacido del Espíritu, espíritu es.',
      ),
      const QuizQuestion(
        question: '¿Qué significa el concepto de "Adopción" en el Nuevo Testamento?',
        options: ['A) Que somos amigos de Dios', 'B) Que Dios nos hace Sus hijos legales con todos los derechos de herencia', 'C) Que somos esclavos de Dios', 'D) Que somos invitados temporales'],
        correctIndex: 1, // B
        hint: 'Romanos 8 habla de pasar de esclavitud a hijos.',
      ),
      const QuizQuestion(
        question: '¿Qué palabra íntima permite el Espíritu que digamos a Dios?',
        options: ['A) Señor', 'B) Abba (Padre)', 'C) Juez', 'D) Creador'],
        correctIndex: 1, // B
        hint: 'Es un término de confianza familiar profunda.',
      ),
      const QuizQuestion(
        question: '¿Qué seguridad nos da el Espíritu según Romanos 8:16?',
        options: ['A) Que seremos ricos', 'B) El Espíritu mismo da testimonio a nuestro espíritu, de que somos hijos de Dios', 'C) Que no tendremos problemas', 'D) Que somos mejores que otros'],
        correctIndex: 1, // B
        hint: 'Es una convicción interna divina.',
      ),
      const QuizQuestion(
        question: '¿Cuál es nuestra condición antes de la regeneración según Efesios 2?',
        options: ['A) Estábamos un poco cansados', 'B) Estábamos muertos en delitos y pecados', 'C) Éramos buscadores de Dios', 'D) No pasaba nada'],
        correctIndex: 1, // B
        hint: 'Un muerto no puede darse vida a sí mismo; necesita un milagro.',
      ),
      const QuizQuestion(
        question: '¿Qué significa ser "coherederos con Cristo"?',
        options: ['A) Que mandaremos sobre Jesús', 'B) Que compartiremos la herencia de gloria y el Reino junto con el Hijo', 'C) Que Jesús nos dará dinero', 'D) Que somos iguales a Dios'],
        correctIndex: 1, // B
        hint: 'Nuestra posición está ligada a la de Cristo.',
      ),
      const QuizQuestion(
        question: '¿Por qué la carne no puede heredar el Reino?',
        options: ['A) Porque la carne es pecado', 'B) Porque se requiere una naturaleza espiritual compatible con el Reino de Dios', 'C) Porque no hay comida en el cielo', 'D) Porque es muy pesada'],
        correctIndex: 1, // B
        hint: 'Jesús dijo que lo nacido de la carne, carne es.',
      ),
      const QuizQuestion(
        question: '¿Es la regeneración un proceso largo o un acto instantáneo de Dios?',
        options: ['A) Es un proceso de años', 'B) Es un acto soberano e instantáneo que inicia la vida espiritual', 'C) Depende de cuánto estudiemos', 'D) Ocurre después de morir'],
        correctIndex: 1, // B
        hint: 'Es el inicio (nacimiento) de la vida cristiana.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el resultado de la adopción respecto al temor?',
        options: ['A) Que ahora tememos más a Dios', 'B) Ya no estamos en temor bajo esclavitud, sino en confianza filial', 'C) Que ya no respetamos a Dios', 'D) No hay cambio'],
        correctIndex: 1, // B
        hint: 'El amor perfecto de un Padre echa fuera el temor del castigo.',
      ),
    ],
  ),
  35: LessonData(
    id: 35,
    title: 'La Persona y Obra del Espíritu Santo (Neumatología)',
    biblicalReference: 'Juan 14:16-17, 26; Hechos 1:8; Efesios 4:30 (RVR1960)',
    biblicalText:
        '"Y yo rogaré al Padre, y os dará otro Consolador, para que esté con vosotros para siempre: el Espíritu de verdad... [...] Mas el Consolador... a quien el Padre enviará en mi nombre, él os enseñará todas las cosas, y os recordará todo lo que yo os he dicho. [...] Pero recibiréis poder, cuando haya venido sobre vosotros el Espíritu Santo, y me seréis testigos... [...] Y no contristéis al Espíritu Santo de Dios, con el cual fuisteis sellados para el día de la redención."',
    explanation:
        'El Espíritu Santo no es una "fuerza" o una energía impersonal; es la Tercera Persona de la Trinidad. Tiene intelecto, voluntad y emociones (por eso puede ser "contristado" o entristecido). Su obra principal es glorificar a Cristo, convencer al mundo de pecado, guiar al creyente a la verdad y darle poder para testificar. Al momento de creer, el Espíritu "sella" al cristiano, lo que significa que Dios pone Su marca de propiedad y garantía sobre él.',
    questions: [
      const QuizQuestion(
        question: '¿Qué título le dio Jesús al Espíritu Santo en Juan 14?',
        options: ['A) El Juez', 'B) El Consolador (Paracleto)', 'C) El Viento', 'D) El Ángel de luz'],
        correctIndex: 1, // B
        hint: '"Paracleto" significa alguien que es llamado al lado para ayudar.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que el Espíritu sea "otro" Consolador?',
        options: ['A) Que es diferente a Jesús', 'B) Que es uno del mismo tipo y esencia que Jesús (allos)', 'C) Que es un sustituto menor', 'D) Que es una fuerza nueva'],
        correctIndex: 1, // B
        hint: 'Jesús se iba, pero enviaba a alguien igual de divino que Él.',
      ),
      const QuizQuestion(
        question: '¿Cuál es una de las funciones del Espíritu según Juan 14:26?',
        options: ['A) Castigar al creyente', 'B) Enseñarnos todas las cosas y recordarnos las palabras de Jesús', 'C) Darnos fama', 'D) Escribir nuevos libros'],
        correctIndex: 1, // B
        hint: 'Es el Maestro interno de la Iglesia.',
      ),
      const QuizQuestion(
        question: '¿Qué sucede cuando alguien "contrista" al Espíritu?',
        options: ['A) El Espíritu se va para siempre', 'B) El Espíritu se entristece por el pecado o desobediencia del creyente', 'C) No pasa nada', 'D) El Espíritu pierde Su poder'],
        correctIndex: 1, // B
        hint: 'Solo una persona con sentimientos puede ser contristada.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que el creyente es "sellado" con el Espíritu Santo?',
        options: ['A) Que tiene un tatuaje', 'B) Que es propiedad de Dios y tiene una garantía de salvación futura', 'C) Que ya no puede pecar', 'D) Que es invisible al diablo'],
        correctIndex: 1, // B
        hint: 'Un sello en la antigüedad indicaba autenticidad y propiedad.',
      ),
      const QuizQuestion(
        question: '¿Para qué reciben poder los discípulos en Hechos 1:8?',
        options: ['A) Para hacer trucos', 'B) Para ser testigos de Jesús en todo el mundo', 'C) Para gobernar países', 'D) Para ser ricos'],
        correctIndex: 1, // B
        hint: 'El propósito del poder es la misión evangelizadora.',
      ),
      const QuizQuestion(
        question: '¿En qué parte del creyente habita el Espíritu Santo?',
        options: ['A) Solo en sus manos', 'B) Mora dentro del creyente (su cuerpo es templo)', 'C) Está solo en la iglesia física', 'D) Está a mucha distancia'],
        correctIndex: 1, // B
        hint: 'Jesús dijo: "estará en vosotros".',
      ),
      const QuizQuestion(
        question: '¿Cuál es la obra del Espíritu respecto al mundo (Juan 16:8)?',
        options: ['A) Destruirlo pronto', 'B) Convencerlo de pecado, justicia y juicio', 'C) Ignorarlo', 'D) Darle riquezas'],
        correctIndex: 1, // B
        hint: 'Él prepara el corazón para que la gente vea su necesidad de Dios.',
      ),
      const QuizQuestion(
        question: '¿Por qué el Espíritu es llamado "Espíritu de Verdad"?',
        options: ['A) Porque no puede mentir y guía a toda la verdad de Dios', 'B) Porque es un concepto abstracto', 'C) Porque castiga las mentiras', 'D) Porque sabe mucha ciencia'],
        correctIndex: 0, // A
        hint: 'Su carácter es la santidad y la veracidad absoluta.',
      ),
      const QuizQuestion(
        question: '¿Cómo se describe la relación del Espíritu con el creyente en Juan 14:17?',
        options: ['A) Temporal', 'B) Estará con vosotros para siempre', 'C) Solo cuando nos portamos bien', 'D) No hay relación'],
        correctIndex: 1, // B
        hint: 'Es una presencia permanente en la nueva alianza.',
      ),
    ],
  ),
  36: LessonData(
    id: 36,
    title: 'El Cuerpo de Cristo (Eclesiología)',
    biblicalReference: '1 Corintios 12:12-14, 27; Efesios 1:22-23; 4:11-12 (RVR1960)',
    biblicalText:
        '"Porque así como el cuerpo es uno, y tiene muchos miembros... así también Cristo. Porque por un solo Espíritu fuisteis todos bautizados en un cuerpo... [...] Vosotros, pues, sois el cuerpo de Cristo, y miembros cada uno en particular. [...] Y él mismo constituyó a unos, apóstoles; a otros, profetas... a fin de perfeccionar a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo."',
    explanation:
        'La Iglesia no es un edificio, sino un organismo vivo llamado "El Cuerpo de Cristo". Cada creyente tiene una función distinta (como los ojos, manos o pies en un cuerpo humano), pero todos están unidos bajo una misma Cabeza, que es Cristo. El nivel teológico aquí es entender la Unidad en la Diversidad: el Espíritu reparte dones diferentes para que la iglesia crezca sana. Si un miembro sufre, todos sufren. La meta de la iglesia es la edificación mutua y reflejar a Cristo en la tierra.',
    questions: [
      const QuizQuestion(
        question: '¿Quién es la Cabeza de la Iglesia según la Biblia?',
        options: ['A) El Pastor', 'B) El Papa', 'C) Jesucristo', 'D) El Concilio'],
        correctIndex: 2, // C
        hint: 'De Él depende todo el cuerpo para su dirección.',
      ),
      const QuizQuestion(
        question: '¿Qué metáfora usa Pablo en 1 Corintios 12 para explicar la diversidad de la iglesia?',
        options: ['A) Un edificio de piedras', 'B) Un cuerpo humano con muchos miembros', 'C) Un campo de trigo', 'D) Una red de pesca'],
        correctIndex: 1, // B
        hint: 'Resalta la interdependencia de los creyentes.',
      ),
      const QuizQuestion(
        question: '¿Cómo entramos a formar parte de este "Cuerpo"?',
        options: ['A) Por pagar una membresía', 'B) Por el bautismo del Espíritu al momento de creer', 'C) Por nacer en una familia cristiana', 'D) Por voluntad propia'],
        correctIndex: 1, // B
        hint: 'Es una operación espiritual de unidad.',
      ),
      const QuizQuestion(
        question: '¿Qué sucede si un miembro del cuerpo se cree más importante que otro?',
        options: ['A) El cuerpo funciona mejor', 'B) Se rompe la unidad, porque todos los miembros son necesarios', 'C) Tiene razón', 'D) Nada'],
        correctIndex: 1, // B
        hint: 'El ojo no puede decirle a la mano: "No te necesito".',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito de los dones (apóstoles, maestros, etc.) en Efesios 4?',
        options: ['A) Para que tengan títulos altos', 'B) Para perfeccionar a los santos y edificar el cuerpo de Cristo', 'C) Para mandar sobre los demás', 'D) Para ganar dinero'],
        correctIndex: 1, // B
        hint: 'Tienen un fin de servicio y crecimiento grupal.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que seamos "miembros cada uno en particular"?',
        options: ['A) Que somos independientes', 'B) Que cada uno tiene una función única y valiosa diseñada por Dios', 'C) Que no necesitamos a nadie más', 'D) Que somos iguales en todo'],
        correctIndex: 1, // B
        hint: 'Diversidad de funciones en una sola unidad.',
      ),
      const QuizQuestion(
        question: '¿Quién reparte los dones en la iglesia?',
        options: ['A) Los líderes humanos', 'B) El Espíritu Santo como Él quiere', 'C) La suerte', 'D) Se compran con estudio'],
        correctIndex: 1, // B
        hint: 'Es una distribución soberana divina.',
      ),
      const QuizQuestion(
        question: '¿Qué debe pasar si un miembro del cuerpo sufre?',
        options: ['A) Ignorarlo', 'B) Todos los miembros se duelen con él', 'C) Expulsarlo', 'D) Reírse'],
        correctIndex: 1, // B
        hint: 'La iglesia debe ser una comunidad de empatía total.',
      ),
      const QuizQuestion(
        question: '¿A qué se refiere el término "Iglesia Universal"?',
        options: ['A) A todas las religiones', 'B) Al conjunto de todos los creyentes en Cristo de todos los tiempos y lugares', 'C) A una iglesia en el espacio', 'D) Solo a la iglesia local'],
        correctIndex: 1, // B
        hint: 'Es el cuerpo completo bajo una sola Cabeza.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el objetivo final de la iglesia según Efesios 4:13?',
        options: ['A) Ser la religión más grande', 'B) Llegar a la unidad de la fe y al conocimiento del Hijo de Dios, a un varón perfecto', 'C) Construir templos de oro', 'D) Dominar el mundo político'],
        correctIndex: 1, // B
        hint: 'Es la madurez espiritual colectiva a la imagen de Jesús.',
      ),
    ],
  ),
  37: LessonData(
    id: 37,
    title: 'La Santificación',
    biblicalReference: '1 Tesalonicenses 4:3; Romanos 6:22; Filipenses 1:6 (RVR1960)',
    biblicalText:
        '"Pues la voluntad de Dios es vuestra santificación... [...] Mas ahora que habéis sido libertados del pecado y hechos siervos de Dios, tenéis por vuestro fruto la santificación, y como fin, la vida eterna. [...] estando persuadido de esto, que el que comenzó en vosotros la buena obra, la perfeccionará hasta el día de Jesucristo."',
    explanation:
        'La santificación es el proceso continuo donde Dios obra en el creyente para separarlo del pecado y transformarlo a la imagen de Cristo. No es un esfuerzo humano solitario, sino una cooperación: el creyente decide "presentar sus miembros" a la justicia, y Dios opera internamente para perfeccionar esa obra. El fin de este proceso es reflejar la santidad de Dios en el carácter y la conducta.',
    questions: [
      const QuizQuestion(
        question: '¿Qué diferencia hay entre Justificación y Santificación?',
        options: ['A) Son lo mismo', 'B) La Justificación nos declara justos; la Santificación nos hace santos en la práctica día a día', 'C) La Santificación es solo para pastores', 'D) La Justificación es un proceso largo'],
        correctIndex: 1, // B
        hint: 'Una es un estatus legal y la otra es una transformación de vida.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la "voluntad de Dios" explícita en 1 Tesalonicenses 4:3?',
        options: ['A) Que seamos ricos', 'B) Nuestra santificación', 'C) Que no tengamos problemas', 'D) Que todos sean profetas'],
        correctIndex: 1, // B
        hint: 'Es el deseo central de Dios para el desarrollo del carácter del cristiano.',
      ),
      const QuizQuestion(
        question: '¿Qué significa "presentar los miembros" para servir a la justicia?',
        options: ['A) Ir al gimnasio', 'B) Poner nuestro cuerpo, mente y voluntad a disposición de lo que es recto ante Dios', 'C) No hacer nada', 'D) Solo ir a la iglesia'],
        correctIndex: 1, // B
        hint: 'Es una decisión activa de obediencia.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el fruto de ser libertados del pecado según Romanos 6:22?',
        options: ['A) El orgullo', 'B) La santificación', 'C) La fama', 'D) El aburrimiento'],
        correctIndex: 1, // B
        hint: 'Es el resultado natural de vivir para Dios.',
      ),
      const QuizQuestion(
        question: '¿Quién es el que garantiza que la "buena obra" será perfeccionada?',
        options: ['A) Nosotros mismos', 'B) Dios (el que comenzó la obra)', 'C) Los ángeles', 'D) El destino'],
        correctIndex: 1, // B
        hint: 'Filipenses 1:6 nos da la seguridad de que Dios no deja las cosas a medias.',
      ),
      const QuizQuestion(
        question: '¿Hasta cuándo dura el proceso de santificación?',
        options: ['A) Hasta el bautismo', 'B) Hasta el día de Jesucristo (Su venida o nuestra muerte)', 'C) Un año', 'D) Hasta que somos adultos'],
        correctIndex: 1, // B
        hint: 'Es un camino que termina al encontrarnos cara a cara con el Señor.',
      ),
      const QuizQuestion(
        question: '¿Qué papel tiene el Espíritu Santo en la santificación?',
        options: ['A) Ninguno', 'B) Es el agente principal que nos guía, convence y fortalece para cambiar', 'C) Solo nos mira', 'D) Nos obliga a ser santos sin nuestra voluntad'],
        correctIndex: 1, // B
        hint: 'Él produce el "fruto" en nosotros.',
      ),
      const QuizQuestion(
        question: '¿Por qué la santificación es necesaria si ya somos salvos?',
        options: ['A) Porque sin ella perdemos la salvación cada día', 'B) Porque es la evidencia de la vida de Dios en nosotros y el camino a la madurez espiritual', 'C) Para presumir ante otros', 'D) No es necesaria'],
        correctIndex: 1, // B
        hint: 'Un árbol vivo debe dar frutos de su naturaleza.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que la santificación sea "progresiva"?',
        options: ['A) Que es muy rápida', 'B) Que ocurre por etapas de crecimiento y maduración', 'C) Que es opcional', 'D) Que solo los mejores la alcanzan'],
        correctIndex: 1, // B
        hint: 'Al igual que un bebé crece hasta ser adulto, el cristiano madura.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el "fin" o destino final mencionado en Romanos 6:22?',
        options: ['A) El dinero', 'B) La vida eterna', 'C) El reconocimiento humano', 'D) El olvido'],
        correctIndex: 1, // B
        hint: 'La santidad nos prepara para vivir en la presencia eterna de Dios.',
      ),
    ],
  ),
  38: LessonData(
    id: 38,
    title: 'El Tribunal de Cristo y las Coronas (Escatología)',
    biblicalReference: '2 Corintios 5:10; 1 Corintios 3:11-15; 2 Timoteo 4:8 (RVR1960)',
    biblicalText:
        '"Porque es necesario que todos nosotros comparezcamos ante el tribunal de Cristo, para que cada uno reciba según lo que haya hecho... [...] La obra de cada uno se hará manifiesta... el fuego la probará. Si permaneciere la obra de alguno que sobreedificó, recibirá recompensa. Si la obra de alguno se quemare, él sufrirá pérdida, si bien él mismo será salvo, aunque así como por fuego. [...] Por lo demás, me está guardada la corona de justicia, la cual me dará el Señor... a todos los que aman su venida."',
    explanation:
        'El "Tribunal de Cristo" (del griego Bema) no es un juicio para condenación (pues el creyente ya es salvo), sino un juicio de recompensa. Aquí se evaluará la fidelidad, los motivos y el servicio del cristiano. Las obras hechas para la gloria de Dios se comparan con oro, plata y piedras preciosas; las hechas con motivos egoístas son madera, heno y hojarasca que el fuego consume. Se mencionan varias "coronas" como símbolos de autoridad y honor que los creyentes recibirán para luego rendirlas ante los pies de Jesús.',
    questions: [
      const QuizQuestion(
        question: '¿Quiénes comparecerán ante el Tribunal de Cristo (Bema)?',
        options: ['A) Solo los pecadores', 'B) Todos los creyentes en Cristo', 'C) Solo los pastores', 'D) Los ángeles caídos'],
        correctIndex: 1, // B
        hint: 'Es un examen para los que ya pertenecen a la familia de Dios.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el propósito de este tribunal según 2 Corintios 5:10?',
        options: ['A) Decidir quién va al cielo', 'B) Que cada uno reciba recompensa según lo hecho mientras estaba en el cuerpo', 'C) Castigar con el infierno', 'D) Contar cuántas Biblias leímos'],
        correctIndex: 1, // B
        hint: 'Se enfoca en la evaluación del servicio y la fidelidad.',
      ),
      const QuizQuestion(
        question: '¿Qué elemento usará Dios para probar la calidad de nuestras obras?',
        options: ['A) Agua', 'B) El fuego', 'C) El viento', 'D) Una balanza'],
        correctIndex: 1, // B
        hint: 'El fuego purifica lo valioso y consume lo inútil.',
      ),
      const QuizQuestion(
        question: '¿Qué representan el oro, la plata y las piedras preciosas en 1 Corintios 3?',
        options: ['A) Riqueza material', 'B) Obras hechas con motivos puros y conforme a la voluntad de Dios', 'C) Joyas físicas que tendremos en el cielo', 'D) Nuestra inteligencia'],
        correctIndex: 1, // B
        hint: 'Son materiales que resisten la prueba del fuego.',
      ),
      const QuizQuestion(
        question: '¿Qué sucede si la obra de un creyente se quema?',
        options: ['A) Pierde su salvación', 'B) Sufre pérdida de recompensa, pero él mismo es salvo como por fuego', 'C) Es enviado al juicio final', 'D) Tiene que volver a empezar la vida'],
        correctIndex: 1, // B
        hint: 'La salvación es por gracia, la recompensa es por servicio.',
      ),
      const QuizQuestion(
        question: '¿Qué menciona Pablo en 2 Timoteo 4:8 como su esperanza final?',
        options: ['A) Una casa grande', 'B) La corona de justicia', 'C) Ser recordado en la historia', 'D) No morir'],
        correctIndex: 1, // B
        hint: 'Es un premio otorgado por el Juez justo a quienes fueron fieles.',
      ),
      const QuizQuestion(
        question: '¿A quiénes se les promete la corona de justicia?',
        options: ['A) Solo a los mártires', 'B) A todos los que aman Su venida', 'C) A los que nunca pecaron', 'D) A los reyes de la tierra'],
        correctIndex: 1, // B
        hint: 'Es para quienes viven con la expectativa del regreso de Cristo.',
      ),
      const QuizQuestion(
        question: '¿Qué simbolizan las "coronas" en el cielo?',
        options: ['A) Que mandaremos a los ángeles', 'B) Posiciones de autoridad, honor y servicio en el Reino venidero', 'C) Que seremos más bonitos', 'D) Nada, son solo adornos'],
        correctIndex: 1, // B
        hint: 'Representan el reconocimiento de Dios a nuestra fidelidad.',
      ),
      const QuizQuestion(
        question: '¿Qué harán los redimidos con sus coronas según Apocalipsis 4:10?',
        options: ['A) Guardarlas en un cofre', 'B) Las echarán delante del trono de Dios en adoración', 'C) Presumirlas ante otros', 'D) Venderlas'],
        correctIndex: 1, // B
        hint: 'Toda gloria recibida vuelve a Aquel que nos dio la fuerza para servir.',
      ),
      const QuizQuestion(
        question: '¿Cuál debe ser nuestra motivación para servir, sabiendo que habrá un tribunal?',
        options: ['A) El miedo al castigo', 'B) El amor a Cristo y el deseo de agradarle en todo', 'C) Ser mejores que otros creyentes', 'D) Ganar dinero'],
        correctIndex: 1, // B
        hint: 'Servimos por gratitud a Aquel que nos salvó primero.',
      ),
    ],
  ),
  39: LessonData(
    id: 39,
    title: 'El Estado Eterno (Cielo Nuevo y Tierra Nueva)',
    biblicalReference: 'Apocalipsis 21:1-5; 22:3-5 (RVR1960)',
    biblicalText:
        '"Vi un cielo nuevo y una tierra nueva; porque el primer cielo y la primera tierra pasaron... Y yo Juan vi la santa ciudad, la nueva Jerusalén, descender del cielo... dispuesta como una esposa ataviada para su marido. [...] Y oí una gran voz del cielo que decía: He aquí el tabernáculo de Dios con los hombres... y Dios mismo estará con ellos como su Dios. Enjugará Dios toda lágrima... y ya no habrá muerte... porque las primeras cosas pasaron. [...] Y no habrá más maldición... y verán su rostro, y su nombre estará en sus frentes."',
    explanation:
        'La esperanza final del cristiano no es vivir como un espíritu flotante en las nubes, sino la restauración total de la creación. Dios creará un cielo nuevo y una tierra nueva donde la justicia more permanentemente. La Nueva Jerusalén representa la morada perfecta de Dios con la humanidad redimida. En este estado eterno, la "maldición" del pecado (muerte, dolor, llanto) será eliminada por completo. La mayor bendición del cielo no son las calles de oro, sino la Visión Beatífica: ver el rostro de Dios y vivir en comunión ininterrumpida con Él.',
    questions: [
      const QuizQuestion(
        question: '¿Qué sucede con el primer cielo y la primera tierra según Apocalipsis 21?',
        options: ['A) Se quedan igual para siempre', 'B) Pasaron (dejan de existir en su forma caída) para dar lugar a lo nuevo', 'C) Se hunden en el mar', 'D) Se vuelven invisibles'],
        correctIndex: 1, // B
        hint: 'Dios hace nuevas todas las cosas.',
      ),
      const QuizQuestion(
        question: '¿Cómo se llama la ciudad celestial que desciende de Dios?',
        options: ['A) Babilonia', 'B) La Nueva Jerusalén', 'C) El Paraíso Perdido', 'D) Roma Celestial'],
        correctIndex: 1, // B
        hint: 'Es la morada de los redimidos y el tabernáculo de Dios.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el cambio más importante en la relación de Dios con los hombres en el estado eterno?',
        options: ['A) Dios estará lejos', 'B) Dios mismo estará con ellos como su Dios y habitará con ellos', 'C) Solo nos comunicaremos por ángeles', 'D) No habrá relación'],
        correctIndex: 1, // B
        hint: 'Es el cumplimiento final del propósito de la creación: comunión total.',
      ),
      const QuizQuestion(
        question: '¿Qué cosas ya no existirán en la nueva creación según el versículo 4?',
        options: ['A) Los animales', 'B) El llanto, el clamor, el dolor y la muerte', 'C) El trabajo', 'D) Las personas'],
        correctIndex: 1, // B
        hint: 'Son todas las consecuencias de la caída y el pecado.',
      ),
      const QuizQuestion(
        question: '¿Qué significa que "las primeras cosas pasaron"?',
        options: ['A) Que olvidaremos nuestros nombres', 'B) Que el orden del mundo bajo el pecado y la maldición ha terminado', 'C) Que ya no habrá historia', 'D) Que Dios cambió de opinión'],
        correctIndex: 1, // B
        hint: 'Es la victoria definitiva sobre el caos y el mal.',
      ),
      const QuizQuestion(
        question: '¿Qué se menciona en Apocalipsis 22:3 que ya "no habrá más"?',
        options: ['A) Comida', 'B) Maldición', 'C) Sol', 'D) Sueño'],
        correctIndex: 1, // B
        hint: 'Es la reversión total de lo que ocurrió en el Jardín del Edén.',
      ),
      const QuizQuestion(
        question: '¿Qué es la "Visión Beatífica" mencionada en el versículo 4?',
        options: ['A) Ver una película', 'B) Ver el rostro de Dios (comunión cara a cara)', 'C) Tener buena vista', 'D) Ver el futuro'],
        correctIndex: 1, // B
        hint: 'Es el anhelo más profundo del alma satisfecha en Dios.',
      ),
      const QuizQuestion(
        question: '¿Por qué se dice que no habrá necesidad de luz de lámpara ni de luz del sol (22:5)?',
        options: ['A) Porque dormiremos siempre', 'B) Porque Dios el Señor los iluminará con Su gloria', 'C) Porque seremos ciegos', 'D) Porque habrá luz eléctrica'],
        correctIndex: 1, // B
        hint: 'La presencia de Dios es la fuente de toda iluminación espiritual y física.',
      ),
      const QuizQuestion(
        question: '¿Cómo se describe a la Nueva Jerusalén en términos de su belleza?',
        options: ['A) Como una fortaleza militar', 'B) Como una esposa ataviada para su marido', 'C) Como un campo desierto', 'D) Como una nube gris'],
        correctIndex: 1, // B
        hint: 'Indica pureza, amor y preparación especial de Dios.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el mensaje central de la escatología para el creyente hoy?',
        options: ['A) Tener miedo al futuro', 'B) Esperanza y consuelo de que Dios restaurará todo y triunfará sobre el mal', 'C) Tratar de adivinar fechas', 'D) Ignorar lo que viene'],
        correctIndex: 1, // B
        hint: 'Es el ancla de nuestra fe en medio de las pruebas actuales.',
      ),
    ],
  ),
  40: LessonData(
    id: 40,
    title: 'La Gran Comisión y el Retorno de Cristo',
    biblicalReference: 'Mateo 28:18-20; Hechos 1:11; Apocalipsis 22:12, 20 (RVR1960)',
    biblicalText:
        '"Y Jesús se acercó y les habló diciendo: Toda potestad me es dada en el cielo y en la tierra. Por tanto, id, y haced discípulos a todas las naciones, bautizándolos en el nombre del Padre, y del Hijo, y del Espíritu Santo... [...] Varones galileos, ¿por qué estáis mirando al cielo? Este mismo Jesús, que ha sido tomado de vosotros al cielo, así vendrá como le habéis visto ir al cielo. [...] He aquí yo vengo pronto, y mi galardón conmigo, para recompensar a cada uno según sea su obra. El que da testimonio de estas cosas dice: Ciertamente vengo en breve. Amén; sí, ven, Señor Jesús."',
    explanation:
        'La vida cristiana se vive entre dos eventos monumentales: la Ascensión y la Segunda Venida. Antes de partir, Jesús dejó la Gran Comisión, que no es una sugerencia, sino un mandato imperativo de expandir el Reino mediante el discipulado y el bautismo bajo la autoridad de Su nombre. Mientras la Iglesia cumple esta misión, vive en la expectativa de la Parusía (Su retorno glorioso). A diferencia de Su primera venida en humildad, Su retorno será en poder y gloria para juzgar, recompensar y establecer Su Reino físico y eterno. La actitud del creyente debe ser de trabajo diligente ("id") y oración ferviente ("Ven, Señor Jesús").',
    questions: [
      const QuizQuestion(
        question: '¿Cuál es la base legal sobre la cual Jesús otorga la Gran Comisión (Mateo 28:18)?',
        options: ['A) La opinión de los discípulos.', 'B) Que toda potestad (autoridad) le es dada en el cielo y en la tierra.', 'C) Las leyes de Roma.', 'D) El permiso de los fariseos.'],
        correctIndex: 1, // B
        hint: 'El mandato se fundamenta en Su soberanía absoluta tras la resurrección.',
      ),
      const QuizQuestion(
        question: '¿Cuál es el verbo principal (mandato core) de la Gran Comisión?',
        options: ['A) Viajar por el mundo.', 'B) Haced discípulos.', 'C) Construir templos.', 'D) Escribir libros.'],
        correctIndex: 1, // B
        hint: 'El objetivo no es solo tener creyentes, sino seguidores formados (mathetes).',
      ),
      const QuizQuestion(
        question: '¿Bajo qué nombre se debe realizar el bautismo según el mandato de Jesús?',
        options: ['A) En el nombre de la Iglesia.', 'B) En el nombre del Padre, y del Hijo, y del Espíritu Santo.', 'C) En el nombre de los apóstoles.', 'D) No es necesario usar un nombre.'],
        correctIndex: 1, // B
        hint: 'Es una fórmula trinitaria que reconoce la unidad de la Deidad.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la promesa de Jesús para quienes cumplen la misión (v. 20)?',
        options: ['A) Que serán ricos.', 'B) "Yo estoy con vosotros todos los días, hasta el fin del mundo".', 'C) Que no tendrán enemigos.', 'D) Que serán famosos.'],
        correctIndex: 1, // B
        hint: 'Es la garantía de Su presencia constante y empoderadora.',
      ),
      const QuizQuestion(
        question: '¿Qué dijeron los ángeles en la ascensión sobre la forma en que Jesús volvería?',
        options: ['A) Que volvería de forma invisible.', 'B) Que así vendrá como le habéis visto ir al cielo (personal y visible).', 'C) Que no volvería nunca.', 'D) Que nacería como un bebé otra vez.'],
        correctIndex: 1, // B
        hint: 'Su retorno será literal, físico y observable por todos.',
      ),
      const QuizQuestion(
        question: '¿Qué trae Jesús consigo en Su retorno según Apocalipsis 22:12?',
        options: ['A) Castigo para todos sin excepción.', 'B) Su galardón para recompensar a cada uno según sea su obra.', 'C) Nuevas leyes escritas.', 'D) Oro y plata físicos.'],
        correctIndex: 1, // B
        hint: 'Se refiere a los premios por la fidelidad en el servicio (visto en la lección 38).',
      ),
      const QuizQuestion(
        question: '¿Qué significa la palabra "Maranata" (implícita en el v. 20)?',
        options: ['A) Dios es amor.', 'B) El Señor viene.', 'C) Paz a vosotros.', 'D) Fin del mundo.'],
        correctIndex: 1, // B
        hint: 'Era el saludo y la oración de la iglesia primitiva esperando Su retorno.',
      ),
      const QuizQuestion(
        question: '¿A quiénes debe alcanzar la Gran Comisión?',
        options: ['A) Solo a los vecinos.', 'B) A todas las naciones (pueblos y etnias).', 'C) Solo a los que hablan hebreo.', 'D) Solo a los que quieren escuchar.'],
        correctIndex: 1, // B
        hint: 'El alcance del evangelio es global y transcultural.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la actitud que debe caracterizar a la Iglesia mientras espera?',
        options: ['A) Miedo y angustia.', 'B) Pasividad y descanso.', 'C) Vigilancia, trabajo misionero y santidad.', 'D) Indiferencia total.'],
        correctIndex: 2, // C
        hint: 'Debemos estar ocupados en Su obra hasta que Él venga.',
      ),
      const QuizQuestion(
        question: '¿Cuál es la respuesta final de la Iglesia ante la promesa de Jesús "vengo en breve"?',
        options: ['A) "Todavía no, por favor".', 'B) "Amén; sí, ven, Señor Jesús".', 'C) "No te creemos".', 'D) "Estamos muy ocupados".'],
        correctIndex: 1, // B
        hint: 'Es una expresión de anhelo y amor por la presencia del Rey.',
      ),
    ],
  ),
};

