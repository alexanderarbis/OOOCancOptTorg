Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	РегистрБухУчетОстатки.Счет,
		|	РегистрБухУчетОстатки.СуммаОстатокДт,
		|	РегистрБухУчетОстатки.СуммаОстатокКт
		|ИЗ
		|	РегистрБухгалтерии.РегистрБухУчет.Остатки(&МоментВремени, Счет В (&СчетВыручка, &СчетСебестоимость),) КАК
		|		РегистрБухУчетОстатки";
	
	Запрос.УстановитьПараметр("СчетВыручка", ПланыСчетов.БухУчет.Выручка);
	Запрос.УстановитьПараметр("МоментВремени", КонецМесяца(Дата) + 1);
	Запрос.УстановитьПараметр("СчетСебестоимость", ПланыСчетов.БухУчет.Себестоимость);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	СуммаВыручки = 0;
	СуммаСебестоимости = 0;
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		
		Если ВыборкаДетальныеЗаписи.Счет = ПланыСчетов.БухУчет.Выручка Тогда
			СуммаВыручки = ВыборкаДетальныеЗаписи.СуммаОстатокКт;
		ИначеЕсли ВыборкаДетальныеЗаписи.Счет = ПланыСчетов.БухУчет.Себестоимость Тогда
			СуммаСебестоимости = ВыборкаДетальныеЗаписи.СуммаОстатокДт;
		КонецЕсли;

	КонецЦикла;
	
	Движения.РегистрБухУчет.Записывать = Истина;
	
	Проводка = Движения.РегистрБухУчет.Добавить();
	Проводка.Период = Дата;
	Проводка.СчетДт = ПланыСчетов.БухУчет.Выручка;
	Проводка.СчетКт = ПланыСчетов.БухУчет.ПрибылиИУбытки;
	Проводка.Сумма = СуммаВыручки;
	
	Проводка = Движения.РегистрБухУчет.Добавить();
	Проводка.Период = Дата;
	Проводка.СчетДт = ПланыСчетов.БухУчет.ПрибылиИУбытки;
	Проводка.СчетКт = ПланыСчетов.БухУчет.Себестоимость;
	Проводка.Сумма = СуммаСебестоимости;
	
КонецПроцедуры
