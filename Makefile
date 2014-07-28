.PHONY: test dist release clean

test:
	nosetests --with-coverage --cover-package=mdx_superscript

dist:
	python setup.py sdist --formats=gztar,zip bdist_wheel
	gpg --armor --detach-sign -u 5878672C -a dist/MarkdownSuperscript*.whl
	gpg --armor --detach-sign -u 5878672C -a dist/MarkdownSuperscript*.tar.gz
	gpg --armor --detach-sign -u 5878672C -a dist/MarkdownSuperscript*.zip

release:
	twine upload dist/*

clean:
	rm -rf __pycache__
	rm -rf build
	rm -rf dist
	rm -rf Markdown_Superscript.egg-info