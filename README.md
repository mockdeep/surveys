AdLib
=====

AdLib is a web app for creating and taking MadLib style surveys. Here's How it
works.

Creating a survey
-----------------
Coming in to the application, a user either anonymous or registered, can create
a new poll like this:

<blockquote>
I wish I had a __item__. I would pay as much as __amount__ dollars for one. It
would be so great I'd use it to __task1__ and to __task2__. I would feel so
__emotion__ if I had one.
</blockquote>

Any item in the input surrounded by two underscores on each side will become a
field to be filled in by survey takers. Once the survey has been taken the
survey writer can then see the results in a format like:

<table>
  <tr>
    <th>item</th>
    <th>amount</th>
    <th>task1</th>
    <th>task2</th>
    <th>emotion</th>
  </tr>
  <tr>
    <td>light saber</td>
    <td>50</td>
    <td>cut salami</td>
    <td>pick my nose</td>
    <td>cheeky</td>
  </tr>
</table>

Of course, the format lends itself especially to snarky answers, so in order to
allow for that, as well as getting some honest feedback, survey takers will be
able to take the survey twice. If they are not signed in as users it stores
their user_id in their cookies.

Database tables
---------------

* users
  * id
  * email
  * password_digest
  * status
* surveys
  * user_id
  * body
  * admin_slug
  * slug
* survey_field
  * name
  * survey_id
* survey_response
  * user_id
  * survey_id
* field_response
  * survey_response_id
  * field_id
