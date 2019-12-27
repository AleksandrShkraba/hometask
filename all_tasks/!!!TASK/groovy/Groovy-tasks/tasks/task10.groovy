def urlText(string)
{
  def get = new URL(string).openConnection();
  if(get.getResponseCode().equals(200))
    return get.getInputStream().getText()
}

return this
