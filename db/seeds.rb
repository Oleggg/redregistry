Role.create([
  {:name => "Администратор"},
  {:name => "Редактор"},
  {:name => "Оператор"},
])

User.create([
  {:login => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test"},
])

# Профессии
Profession.create([
  {:name => "Программист"},
  {:name => "Инженер"},
])

# Тип организации
CompanyType.create([
  {:name => "Средняя школа"},
  {:name => "Музыкальная школа"},
  {:name => "Университет"},
])

# Категории учёта
Category.create([
  {:name => "Безнадзорный"},
  {:name => "Беспризорный"},
  {:name => "Склонен к бродяжнечеству"},
])

# Основания для регистрации
RegistrationReason.create([
  {:name => "По протоколу коммисии по делам несовершеннолетних"},
  {:name => "Выявлено органами социльной защиты населения"},
])

# Врачи-специалисты
Doctor.create([
  {:name => "окулист"},
  {:name => "хурург"},
  {:name => "психиатр"},
])

# Местонахождения
Location.create([
  {:name => "Возвращен в родную семью"},
  {:name => "Помещен в детский дом"},
])

# Виды родства
Relationship.create([
  {:name => "мать"},
  {:name => "отец"},
])

# Состав семьи
FamilyStructure.create([
  {:name => "обои родители"},
  {:name => "только мать"},
  {:name => "только отец"},
  {:name => "сирота"},
])

# Виды документа
DocumentType.create([
  {:name => "паспорт"},
  {:name => "свидетельство о рождении"},
])

# Виды занятости
EmploymentType.create([
  {:name => "Школьник"},
  {:name => "Работающий"},
])

# Виды документа личного дела
PrivacyDocumentType.create([
  {:name => "внутренний"},
  {:name => "исходящий"},
  {:name => "входящий"},
])

# Категории семей
FamilyType.create([
  {:name => "многодетная"},
  {:name => "полная"},
])

# Виды помощи ребёнку
ChildHelp.create([
  {:name => "Отдыхал в лагере при центре"},
  {:name => "Передан на усыновление"},
])

# Виды помощи семье
FamilyHelp.create([
  {:name => "Денежная"},
  {:name => "Продуктами питания"},
])

# Виды работ с семьёй
FamilyWork.create([
  {:name => "Работа с психологом"},
  {:name => "Проведена беседа"},
])

# Условия проживания
Accommodation.create([
  {:name => "хорошие"},
  {:name => "удовлетворительные"},
])

# Причина постановки на учёт
RegistrationCause.create([
  {:name => "Безнадзорность"},
  {:name => "Употребление алкоголя"},
  {:name => "Поставлен на внутрешкольный учёт"},
])

# Причина снятия с учёта
UnregistrationCause.create([
  {:name => "По возрасту - 18 лет"},
  {:name => "Улучшение положения в семье"},
])

# Характеристики ребёнка - теги :characteristics

Region.create([
  {:name => "Пензенская область"},
])

penza_region = Region.find_by_name("Пензенская область")

District.create([
  {:name => "Лунинский", :region => penza_region},
  {:name => "Пензенский", :region => penza_region},
])

City.create([
  {:name => "Пенза", :region => penza_region},
  {:name => "Кузнецк", :region => penza_region},
])

penza_city = City.find_by_name("Пенза")

company_type = CompanyType.find_by_name("Средняя школа")
company = Company.create(:name => "Школа №1", :company_type => company_type)

person = Person.create(:first_name => 'Иван', :last_name => 'Иванов', :middle_name => 'Иванович',
  :birthday => Date.new(y=1978, m=5, d=2))

person = Person.first

Address.create([
  {:region_id => penza_region.id, :city_id => penza_city.id, :post_code => "440000", :lat => 44.9737, :lng => 53.1846,
   :address_line => "Попова, д.36", :addressable => company},
  {:region_id => penza_region.id, :city_id => penza_city.id, :post_code => "440000", :lat => 44.9737, :lng => 53.1846,
   :address_line => "Попова, д.36", :addressable => person},
])

Family.create([
  {:last_name => "Ивановы", :address => "Пенза, Петровского 185-16"}
])

p = Person.first
Card.create([
  {:person_id => p.id}
])

