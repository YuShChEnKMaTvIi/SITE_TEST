<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Определение шаблона для обработки корневого элемента -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Список сотрудников</title>
        <style>
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid black; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>Список сотрудников</h2>
        <table>
          <tr>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Отчество</th>
            <th>Адрес</th>
            <th>Телефоны</th>
            <th>Должность</th>
            <th>Отдел</th>
          </tr>
          
          <!-- Цикл по каждому сотруднику -->
          <xsl:for-each select="Employees/Employee">
            <tr>
              <!-- Фамилия -->
              <td><xsl:value-of select="FullName/LastName"/></td>
              
              <!-- Имя -->
              <td><xsl:value-of select="FullName/FirstName"/></td>
              
              <!-- Отчество -->
              <td><xsl:value-of select="FullName/MiddleName"/></td>
              
              <!-- Адрес -->
              <td>
                <xsl:value-of select="Address/SettlementName"/>, 
                <xsl:value-of select="Address/Street"/> 
                <xsl:value-of select="Address/Building"/>, 
                <xsl:value-of select="Address/Apartment"/>
              </td>
              
              <!-- Телефоны -->
              <td>
                <xsl:for-each select="PhoneNumbers/*">
                  <xsl:value-of select="."/>
                  <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
              </td>
              
              <!-- Должность -->
              <td><xsl:value-of select="Position"/></td>
              
              <!-- Отдел -->
              <td><xsl:value-of select="Department"/></td>
            </tr>
          </xsl:for-each>
          
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
