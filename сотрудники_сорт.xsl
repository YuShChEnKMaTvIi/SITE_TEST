<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Сортировка по фамилии -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Сотрудники</title>
                <style>
                    table {border-collapse: collapse; width: 100%;}
                    th, td {border: 1px solid #dddddd; padding: 8px; text-align: left;}
                    th {background-color: #f2f2f2;}
                </style>
            </head>
            <body>
                <h2>Список сотрудников</h2>
                <table>
                    <tr>
                        <th>Фамилия</th>
                        <th>Имя</th>
                        <th>Отчество</th>
                        <th>Должность</th>
                        <th>Отдел</th>
                    </tr>
                    <!-- Сортировка сотрудников по фамилии -->
                    <xsl:for-each select="Employees/Employee">
                        <xsl:sort select="FullName/LastName" order="ascending" />
                        <tr>
                            <td><xsl:value-of select="FullName/LastName" /></td>
                            <td><xsl:value-of select="FullName/FirstName" /></td>
                            <td><xsl:value-of select="FullName/MiddleName" /></td>
                            <td><xsl:value-of select="Position" /></td>
                            <td><xsl:value-of select="Department" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
