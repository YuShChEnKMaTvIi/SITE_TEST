<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Определяем шаблон для обработки корня -->
    <xsl:template match="/Employees">
        <html>
            <head>
                <title>Список сотрудников</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h1>Список сотрудников</h1>
                <table>
                    <tr>
                        <th>ФИО</th>
                        <th>Должность</th>
                        <th>Отдел</th>
                        <th>Адрес</th>
                        <th>Телефоны</th>
                    </tr>
                    <!-- Обрабатываем каждый элемент Employee -->
                    <xsl:for-each select="Employee">
                        <tr>
                            <td>
                                <xsl:value-of select="FullName/FirstName"/> 
                                <xsl:value-of select="FullName/MiddleName"/> 
                                <xsl:value-of select="FullName/LastName"/>
                            </td>
                            <td><xsl:value-of select="Position"/></td>
                            <td><xsl:value-of select="Department"/></td>
                            <td>
                                <xsl:value-of select="Address/SettlementName"/>, 
                                <xsl:value-of select="Address/Street"/> 
                                <xsl:value-of select="Address/Building"/>, 
                                <xsl:value-of select="Address/Apartment"/>
                            </td>
                            <td>
                                <xsl:for-each select="PhoneNumbers/*">
                                    <div>
                                        <xsl:value-of select="."/>
                                    </div>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
