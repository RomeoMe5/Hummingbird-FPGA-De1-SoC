# Hummingbird

  В данной работе представлена HDL реализация алгоритма легковесного шифрования Hummingbird. Работа основана на работе Daniel Engels, Xinxin Fan, Guang Gong, Honggang Hu и Eric M. Smith «Ultra-Lightweight Cryptography for Low-Cost RFID Tags: Hummingbird Algorithm and Protocol». Ознакомиться с работой можно [здесь](http://www.silicon-russia.com/2017/06/09/arduino-and-fpga/).

  Проект реализован для платы De1-SoC и разработан в среде Quartus Prime Lite Edition 18.1. Больше информации по плате можно найти на сайте производителя [здесь](https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=205&No=836&PartNo=4).

  В данной ветке представлен проект для Quartus. Для его запуска и тестирования скачайте проект. Файл проекта называется Hummingbird.qpf.

  Модель представленна в виде разных модулей, каждый из которых выполняет свою собственную функцию:
- **encryption_function** - модуль, выполняющий функцию шифрования, обрабатывает блоки данных по 16 бит и выполняет операции наложения ключа функцией xor, табличной замены S-box и линейного преобразования linear_transform;
- **decryption_function** - схожий модуль, выполняющий обратное преобразование строки (функция дешифрования);
