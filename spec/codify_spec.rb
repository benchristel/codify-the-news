require_relative '../lib/html_stripper'

describe HtmlStripper do
  it 'does not modify plain text' do
    expect(HtmlStripper.strip('hello')).to eq 'hello'
  end

  it 'removes scripts' do
    expect(HtmlStripper.strip('before<script src="foo"></script>after')).to eq 'before after'
  end

  it 'looks for the closest end tag to the start tag' do
    expect(HtmlStripper.strip('before<script></script>after</script>')).to eq 'before after '
  end

  it 'removes scripts without a type' do
    expect(HtmlStripper.strip('before<script>function(){}</script>after')).to eq 'before after'
  end

  it 'removes scripts with no content' do
    expect(HtmlStripper.strip('before<script src="foo"></script>after')).to eq 'before after'
  end

  it 'removes multiline scripts' do
    script = %q#before
<script>
require(['foundation/main'], function () {
    require(['article/main']);
    require(['jquery/nyt', 'foundation/views/page-manager'], function ($, pageManager) {
        $(document).ready(function () {
            require(['http://static01.nyt.com/bi/js/tagx/tagx.js'], function () {
                pageManager.trackingFireEventQueue();
            });
        });
    });
});
</script>
after#

    expect(HtmlStripper.strip script).to eq 'before after'
  end

  it 'removes stylesheets' do
    style = %q#before<style>
.messenger.suggestions { display: block !important; height: 50px; }
</style>
after#

    expect(HtmlStripper.strip style).to eq 'before after'
  end

  it 'removes html tags' do
    expect(HtmlStripper.strip('a<p>paragraph</p>here')).to eq 'a paragraph here'
  end


  it 'self closing tags' do
    expect(HtmlStripper.strip('something<p/>else')).to eq 'something else'
  end

  it 'it removes comments' do
    expect(HtmlStripper.strip('What is<!--<g:plusone size="medium"></g:plusone>-->the haps')).to eq 'What is the haps'
  end

  it 'collapses any amount of whitespace into a single space' do
    expect(HtmlStripper.strip("1 \n\t   2")).to eq '1 2'
  end

  it 'removes non-alphanumeric characters' do
    expect(HtmlStripper.strip("foo../bar")).to eq 'foo bar'
  end
end
