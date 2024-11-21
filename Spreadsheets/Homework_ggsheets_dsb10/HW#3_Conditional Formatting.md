## 🖨🏡 Homework3: Conditional Formatting 
### 🛎  โจทย์คือ พนักงานคนไหนเป็น "Excellent Performance" ให้ highlight ทั้งแถว
- [x] **🍱 Steps to create a custom formula : Conditional formatting**
1. Select the Range:
   - Select the entire range of data you want to format
2. Open Conditional Formatting:
   - Go to Format > Conditional formatting.
3. Create a New Rule:
   - Click Add a rule.
4. Choose a Rule Type:
   - Select Custom formula is.
5. Enter the Formula:
   - In the formula bar, paste the formula: **```=$G4="Excellent"```**
6. Apply Formatting:
   - Click the Format button and choose the desired formatting style (e.g., background color, font color, bold, italics).
7. Done:
   - Click Done to apply the conditional formatting.
  
- [x] **🎞 Highlight สีเหลืองทั้งแถว ถ้า Performance = "Excellent"**
![Highlight Excellent](https://github.com/user-attachments/assets/7b94d917-a2b1-486f-8925-16640bf38d51)
     
**📣 Important Note:**
- **Dollar Sign Locking:** To ensure the formula applies to the correct column across all rows, use a dollar sign to lock the column reference. For example,  **```=$G4="Excellent"```** will always refer to column G, regardless of the row.
- **Adjust the Range:** Make sure to adjust the selected range to match your actual data range.
