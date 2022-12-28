

***************
Lambda versions
***************
    When we work on a lambda funcion, we work on latest ($LATEST)
    When we publish, we create a version
    The new version is immutable (You can not change it)
**************
Lambda Aliases
**************
    Aliases are pointers to Lambda function versions
    We can define a dev, test aliases and have them point to different lambda versions
    Aliases are mutable
    We can use Aliases for Blu-Green deployments using weights
