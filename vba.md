---
layout: pages
title: Excel VBA
permalink: /vba/
---

## 📊 Excel Reporting Automation (VBA)

Automated monthly reports using **Excel VBA**, helping to reduce manual steps in financial summaries and improve reliability.

### Highlights

- Generated dynamic pivot tables with department/month breakdowns.
- Preprocessed raw data (e.g. profit calculation) via VBA.
- Recreated and formatted clean sheets for reporting delivery.

### VBA Code Sample

<details>
<summary>Click to view code</summary>

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
</details> ```