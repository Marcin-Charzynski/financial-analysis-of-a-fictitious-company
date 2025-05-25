---
layout: page
title: Financial Analysis Portfolio
permalink: /
---

# Financial Analysis Portfolio

Welcome! This site presents selected projects focused on financial data processing, automation, and reporting.

---

## 📊 Excel Reporting Automation

Automated Excel workflows using VBA to summarize monthly activity and generate on-demand insights.

Here's an example of a macro that takes monthly financial data and generates a summary pivot table:

```vba
Sub MonthlyReport()

    Dim wsData As Worksheet
    Dim wsReport As Worksheet
    Dim lastRow As Long
    Dim rng As Range
    Dim pivotCache As pivotCache
    Dim pivotTable As pivotTable
    Dim dataRange As Range
    
    ' Set worksheet references
    Set wsData = ThisWorkbook.Sheets("Data")
    
    ' Delete old Report if exists
    On Error Resume Next
    Application.DisplayAlerts = False
    ThisWorkbook.Sheets("Report").Delete
    Application.DisplayAlerts = True
    On Error GoTo 0

    ' Add new Report sheet
    Set wsReport = ThisWorkbook.Sheets.Add
    wsReport.Name = "Report"

    ' Add Profit column if not exists
    lastRow = wsData.Cells(wsData.Rows.Count, "A").End(xlUp).Row
    If wsData.Cells(1, 5).Value <> "Profit" Then
        wsData.Cells(1, 5).Value = "Profit"
        wsData.Range("E2:E" & lastRow).Formula = "=C2-D2"
        wsData.Range("E2:E" & lastRow).Value = wsData.Range("E2:E" & lastRow).Value
    End If

    ' Define data range
    Set dataRange = wsData.Range("A1").CurrentRegion

    ' Create pivot table cache
    Set pivotCache = ThisWorkbook.PivotCaches.Create( _
        SourceType:=xlDatabase, _
        SourceData:=dataRange)

    ' Create pivot table
    Set pivotTable = pivotCache.CreatePivotTable( _
        TableDestination:=wsReport.Range("A3"), _
        TableName:="MonthlySummary")

    ' Configure pivot table
    With pivotTable
        .PivotFields("Month").Orientation = xlRowField
        .PivotFields("Department").Orientation = xlColumnField
        .AddDataField .PivotFields("Profit"), "Total Profit", xlSum
    End With

    ' Title
    wsReport.Range("A1").Value = "Monthly Profit Summary"
    wsReport.Range("A1").Font.Size = 14
    wsReport.Range("A1").Font.Bold = True

    MsgBox "Monthly report generated on sheet 'Report'.", vbInformation

End Sub



---

## 🛢 SQL-Based Cost Center Analysis

SQL queries to analyze departmental expenses, identify trends, and support decision-making.

[View SQL]({{ site.baseurl }}/scripts/cost_analysis.sql)

---

## 📈 Power BI Dashboard

Interactive prototype visualizing payment statuses and monthly trends.

![Dashboard Preview]({{ site.baseurl }}/images/dashboard_preview.png)

---

## 📎 Resume

> Available on request or [download PDF]({{ site.baseurl }}/resume.pdf)

---

Contact: [LinkedIn](https://linkedin.com/in/yourprofile) | [GitHub](https://github.com/yourusername)
