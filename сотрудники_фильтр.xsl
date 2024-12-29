<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Параметр для фильтрации по департаменту -->
    <xsl:param name="filterDepartment" select="'ІТ-відділ'"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Список сотрудников</title>
                <style>
                    table {
                        border-collapse: collapse;
                        width: 100%;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>Список сотрудников</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ФИО</th>
                            <th>Адрес</th>
                            <th>Телефоны</th>
                            <th>Должность</th>
                            <th>Департамент</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Фильтрация сотрудников по департаменту -->
                        <xsl:for-each select="Employees/Employee[Department=$filterDepartment]">
                            <tr>
                                <td>
                                    <xsl:value-of select="FullName/LastName"/> 
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="FullName/FirstName"/> 
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="FullName/MiddleName"/>
                                </td>
                                <td>
                                    <xsl:value-of select="Address/SettlementName"/>, 
                                    <xsl:value-of select="Address/Street"/> 
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="Address/Building"/>,
                                    <xsl:value-of select="Address/Apartment"/>
                                </td>
                                <td>
                                    <xsl:for-each select="PhoneNumbers/*">
                                        <xsl:value-of select="."/><br/>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:value-of select="Position"/>
                                </td>
                                <td>
                                    <xsl:value-of select="Department"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
