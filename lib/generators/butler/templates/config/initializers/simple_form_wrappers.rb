# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :butler, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'label' do |label|
      label.use :error, wrap_with: { tag: 'div', class: 'msg' }
      label.use :label_text
    end
    b.use :input
  end

  config.wrappers :butler_cb, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: :label do |label|
      label.use :error, wrap_with: { tag: 'div', class: 'msg' }

      label.use :label_input, { label: false, input_label: true }
      label.wrapper tag: "div", class: "imposter" do; end
      label.use :inline_label
    end
  end

  config.input_class = 'form-control'

  config.default_wrapper = :butler
end
