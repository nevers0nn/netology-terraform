###  Задание 1

Код: [lesson2/task1](lesson2/task1)

- Пункт 4. 
- Ошибки были вида: отсутствие default у cloud_id и folder_id. Наименование переменной vms_ssh_root_key вместо vms_ssh_public_root_key. Указание platform_id = "standart-v4 (такого нет), standart вместо standard
- cores         = 1, минимальное значение 2

- Пункт 5.
![img_4.png](img_4.png)
![img_5.png](img_5.png)

- Пункт 6.
- preemptible = true - данный параметр нужен, чтобы наша ВМ была прерываемой, позволяет экономить деньги
- core_fraction=5 - базовый уровень производительности вм, так же экономит деньги

P.s Зона e была выбрана, т.к. только там были ресурсы. В зоне e нельзя указывать что то ниже standard-v3 (соответственно минимальное значение core_fraction = 20)

---

###  Задание 2

Код: [lesson2/task2](lesson2/task2)

![img_6.png](img_6.png)

---
### Задание 3

Код: [lesson2/task3](lesson2/task3)

![img_7.png](img_7.png)

**Пункт 2 невозможно выполнить в данном случае корректно, так как зона ru-central1-b недоступна**

---

### Задание 4

Код: [lesson2/task4](lesson2/task4)

![img_8.png](img_8.png)

P.s. Предыдущие виртуалки пришлось удалить, поэтому пересоздал с новыми адресами

---

### Задание 5

Код: [lesson2/task5](lesson2/task5)

![img_9.png](img_9.png)

---
### Задание 6

Код: [lesson2/task6](lesson2/ta 

- Пункт 1. Параметры `cores`, `memory`, `core_fraction`, а также размер и тип диска обеих ВМ объединены в одну переменную `vms_resources` типа `map(object)` с ключами `web` и `db`.
- Пункт 2. Для блока `metadata` создана общая переменная `vms_metadata` типа `map(object)`. Из неё и ключа `vms_ssh_public_root_key` в `locals.tf` собирается `local.common_metadata`, который используют обе ВМ.
- Пункт 3. Закомментированы переменные `vm_web_resources` и `vm_db_resources`, которые больше не используются после перехода на `vms_resources`.
- Пункт 4. `terraform plan` — изменений нет:

![img_10.png](img_10.png)
