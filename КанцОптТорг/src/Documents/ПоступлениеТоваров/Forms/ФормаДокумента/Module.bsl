&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	Элементы.Товары.ТекущиеДанные.Сумма = Элементы.Товары.ТекущиеДанные.Количество * Элементы.Товары.ТекущиеДанные.Цена;
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении1(Элемент)
	Элементы.Товары.ТекущиеДанные.Сумма = Элементы.Товары.ТекущиеДанные.Количество * Элементы.Товары.ТекущиеДанные.Цена;
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСуммаПриИзменении(Элемент)
	Элементы.Товары.ТекущиеДанные.Количество = Элементы.Товары.ТекущиеДанные.Сумма / Элементы.Товары.ТекущиеДанные.Цена;
КонецПроцедуры

