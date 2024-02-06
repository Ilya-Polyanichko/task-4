<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Demo</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Roboto', Arial, sans-serif;
            line-height: 2;
        }

        form {
            width: 50%;
            padding: 50px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        pre {
            white-space: pre-wrap;
            font-family: 'Courier New', Courier, monospace;
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <form>
        <label><b>Написать логику проверки условия на freemarker</b><br><hr/>
        Если параметр card равен "Black" или "Platinum" 
        и в параметр eligible пришло булевое значение true, 
        то нужно вывести предложение «Вам доступен бонус».
        Если условия не выполняются, ничего выводить не нужно.</label>
    </form>

    <form>
        <label><b>Решение</b><br><hr/>
        <pre>
            &lt;#if (card == "Black" || card == "Platinum") &amp;&amp; eligible&gt;
                Вам доступен бонус
            &lt;/#if&gt;
        </pre>

        <label><br><b>Полученные параметры</b><br><hr/>
        <label>Параметр card = ${card}. <br>Параметр eligible =
            <#if eligible>
                true
            <#else>
                false
            </#if>
        </label><br>
        <#if (card == "Black" || card == "Platinum") && eligible>
            <label><br><b>Вывод программы</b><br><hr/>
            <label>Вам доступен бонус</label>
        </#if>
    </form>
</body>
</html>