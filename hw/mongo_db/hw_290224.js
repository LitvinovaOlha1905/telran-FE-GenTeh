// use homeworks;

// Есть коллекция employees:

db.employees.insertMany([
	{ name: "Alice", age: 28, position: "Manager", salary: 5000 },
	{ name: "Bob", age: 35, position: "Developer", salary: 6000 },
	{ name: "Charlie", age: 24, position: "Designer", salary: 4000 },
	{ name: "David", age: 31, position: "Analyst", salary: 5500 },
	{ name: "Eva", age: 29, position: "HR", salary: 4500 },
]);

// 1. Найти первых двух сотрудников в списке.
// use employees;
db.employees.find().limit(2);

// 2. Найти сотрудников в возрасте до 30 лет и отсортировать их по возрасту в порядке возрастания.
db.employees.find().sort({ age: 1 });

// 3. Найти сотрудников, пропустив первых двух и ограничив выборку следующими тремя.
db.employees.find().skip(2).limit(3);

// 4. Найти сотрудников, занимающих позицию "Developer" и отсортировать их по возрасту в порядке убывания.
db.employees.find({ position: "Developer" }).sort({ age: -1 });

// 5. Найти сотрудников, занимающих позицию "Manager" и "HR", и отобразить только их имена, ограничив выборку первыми двумя.
db.employees
	.find({ position: { $in: ["Manager", "HR"] } }, { name: 1, _id: 0 })
	.limit(2);

// 6. Найти сотрудников с зарплатой от 4500 до 5500 и отсортировать их по возрасту в порядке возрастания.
db.employees
	.find({
		$and: [{ salary: { $gte: 4500 } }, { salary: { $lte: 5500 } }],
	})
	.sort({ age: 1 });

// или

db.employees
	.find({
		salary: { $gte: 4500, $lte: 5500 },
	})
	.sort({ age: 1 });

// 7. Найти сотрудников с зарплатой выше 5000, пропустив первого, и отобразить только их имена.
db.employees.find({ salary: { $gte: 5000 } }, { _id: 0, name: 1 }).skip(1);

// 8. Найти сотрудников, отсортированных по возрасту в порядке убывания, и вернуть только первого.
db.employees.find().sort({ age: -1 }).limit(1);

// 9. Найти сотрудников в возрасте от 25 до 35 лет и ограничить список первыми тремя.
db.employees.find({ age: { $gte: 25, $lte: 35 } }).limit(3);

// 10. Найти сотрудников с позициями "Manager" или "Developer" и вернуть только их имена и позиции, отсортированных по позиции в алфавитном порядке.
db.employees
	.find(
		{ position: { $in: ["Manager", "Developer"] } },
		{ _id: 0, name: 1, position: 1 }
	)
	.sort({ position: 1 });

// 11. Найти сотрудников с зарплатой выше 4000, пропустив первых двух, и отобразить только их имена и зарплаты.
db.employees
	.find({ salary: { $gt: 4000 } }, { _id: 0, name: 1, salary: 1 })
	.skip(2);

// 12. Найти сотрудников с зарплатой меньше 5500 и отобразить только их имена, отсортированные по имени в алфавитном порядке.
db.employees
	.find({ salary: { $lt: 5500 } }, { _id: 0, name: 1 })
	.sort({ name: 1 });

// 13. Найти сотрудников с позицией "Analyst" и вернуть только их имена и позиции, отсортированных по возрасту в порядке убывания, пропустив первого.
db.employees
	.find({ position: "Analyst" }, { _id: 0, name: 1, position: 1 })
	.sort({ age: -1 })
	.skip(1);

// 2 уровень сложности: Есть коллекция departments:

db.departments.insertMany([
	{
		name: "HR",
		employees: [
			{ name: "Alice", position: "Manager" },
			{ name: "Bob", position: "HR Specialist" },
			{ name: "Charlie", position: "Recruiter" },
			{ name: "David", position: "Assistant" },
			{ name: "Eva", position: "Intern" },
		],
	},
	{
		name: "IT",
		employees: [
			{ name: "Frank", position: "CTO" },
			{ name: "Grace", position: "Developer" },
			{ name: "Henry", position: "SysAdmin" },
			{ name: "Ivy", position: "QA Engineer" },
			{ name: "Jack", position: "Support Specialist" },
		],
	},
]);

// 1. Получить первых двух сотрудников из департамента HR.
db.departments.find({ name: "HR" }, { employees: { $slice: 2 } });

// 2. Получить последних трех сотрудников из департамента IT.
db.departments.find({ name: "IT" }, { employees: { $slice: -3 } });

// 3. Получить третьего и четвертого сотрудников из департамента HR.
db.departments.find(
	{ name: "HR" },
	{ employees: { $slice: ["$employees", 2, 2] } }
);

// 4. Получить первого сотрудника из департамента IT и отобразить только его имя.
db.departments.findOne({ name: "IT" }).employees[0].name;
