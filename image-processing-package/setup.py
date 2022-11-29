from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="package_name",
    version="0.0.1",
    author="IsraelEvangelista",
    author_email="isa_evangelista@hotmail.com",
    description="Desafio DIO Unimed",
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="git@github.com:IsraelEvangelista/UnimedBH/image-processing-package.git"
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.5',
)
