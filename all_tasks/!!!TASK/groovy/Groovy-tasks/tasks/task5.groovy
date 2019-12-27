boolean isIp(str)
{
try {
String[] parts = str.split("\\.");
if (parts.length != 4) return false;
for (int i = 0; i < 4; ++i)
{
int p = Integer.parseInt(parts[i]);
if (p > 255 || p < 0) return false;
else return true;
}
} catch (NumberFormatException ex) {
return false;
}

}
return this


