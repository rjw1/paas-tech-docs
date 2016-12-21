class UniqueIdentifierGenerator
  Anchor = Struct.new(:value, :level)

  def initialize
    @anchors = []
  end

  def create(text, level)
    anchor = Anchor.new(heading_slug(text), level)

    if @anchors.any? { |a| a.value == anchor.value }
      parent = @anchors.reverse.find {|a| a.level < level }
      if parent.present?
        anchor.value = [parent.value, anchor.value].join('-')
      end
    end

    @anchors << anchor

    anchor.value
  end

  # https://github.com/vmg/redcarpet/blob/820dadb98b3720811cc20c5570a5d43c796c85fc/ext/redcarpet/html.c#L274-L305
  def heading_slug(text)
    text
      .downcase
      .gsub(%r{</?[^>]+?>}, '')
      .tr(" -&+$,/:;=?@\"#{}|^~[]`\\*()%.!'", "-")
  end

end
