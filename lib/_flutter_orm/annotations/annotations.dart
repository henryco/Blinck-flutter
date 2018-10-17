import 'package:meta/meta.dart';

class Annotations {
  /*void*/
}

/// Specifies that the class is an entity.
/// This annotation is applied to the entity class.
class Entity {
  /// The entity name. Defaults to the unqualified name of the entity class.
  /// This name is used to refer to the entity in queries. The name must not be
  /// a reserved literal in the Java Persistence query language.
  final String name;

  const Entity([
    this.name = ""
  ]);
}

/// Specifies that the class is an entity.
/// This annotation is applied to the entity class.
const Entity entity = Entity();

/// Specifies the mapped column for a persistent property or field.
/// If no Column annotation is specified, the default values apply.
class Column {
  /// The SQL fragment that is used when generating the DDL for the column.
  /// Defaults to the generated SQL to create a column of the inferred type.
  final String columnDefinition;

  /// The name of the table that contains the column. If absent the
  /// column is assumed to be in the primary table.
  final String table;

  /// The name of the column. Defaults to the property or field name.
  final String name;

  /// Whether the column is included in SQL INSERT
  /// statements generated by the persistence provider.
  final bool insertable;

  /// Whether the column is included in SQL UPDATE statements
  /// generated by the persistence provider.
  final bool updatable;

  /// Whether the database column is nullable.
  final bool nullable;

  /// Whether the column is a unique key.
  final bool unique;

  /// The precision for a decimal (exact numeric) column.
  final int precision;

  /// The column length.
  final int length;

  /// The scale for a decimal (exact numeric) column.
  final int scale;

  const Column({
    this.columnDefinition = "",
    this.table = "",
    this.name = "",
    this.insertable = true,
    this.updatable = true,
    this.nullable = true,
    this.unique = false,
    this.precision = 0,
    this.length = 255,
    this.scale = 0,
  });
}

/// Specifies the mapped column for a persistent property or field.
/// If no Column annotation is specified, the default values apply.
const Column column = Column();


/// Specifies a collection of instances of a basic type or embeddable class.
/// Must be specified if the collection is to be mapped
/// by means of a collection table.
class ElementCollection {
  // todo
  const ElementCollection();
}

/// Specifies a collection of instances of a basic type or embeddable class.
/// Must be specified if the collection is to be mapped
/// by means of a collection table.
const ElementCollection elementCollection = ElementCollection();


/// Specifies a class whose instances are stored as an intrinsic part of an
/// owning entity and share the identity of the entity. Each of the persistent
/// properties or fields of the embedded object is mapped to the database
/// table for the entity. Note that the Transient annotation may be used to
/// designate the non-persistent state of an embeddable class.
class Embeddable {
  const Embeddable();
}

/// Specifies a class whose instances are stored as an intrinsic part of an
/// owning entity and share the identity of the entity. Each of the persistent
/// properties or fields of the embedded object is mapped to the database
/// table for the entity. Note that the Transient annotation may be used to
/// designate the non-persistent state of an embeddable class.
const Embeddable embeddable = Embeddable();

/// Specifies a persistent field or property of an entity whose value is
/// an instance of an embeddable class. The embeddable class must be
/// annotated as Embeddable. The AttributeOverride, AttributeOverrides,
/// AssociationOverride, and AssociationOverrides annotations may be
/// used to override mappings declared or defaulted by the embeddable class.
class Embedded {
  const Embedded();
}

/// Specifies a persistent field or property of an entity whose value is
/// an instance of an embeddable class. The embeddable class must be
/// annotated as Embeddable. The AttributeOverride, AttributeOverrides,
/// AssociationOverride, and AssociationOverrides annotations may be
/// used to override mappings declared or defaulted by the embeddable class.
const Embedded embedded = Embedded();



/// Specifies that the property or field is not persistent.
/// It is used to annotate a property or field of an entity class,
/// mapped superclass, or embeddable class.
class Transient {
  const Transient();
}

/// Specifies that the property or field is not persistent.
/// It is used to annotate a property or field of an entity class,
/// mapped superclass, or embeddable class.
const Transient transient = Transient();


/// Defines mapping for enumerated types. The constants of this enumerated type
/// specify how a persistent property or field of an
/// enumerated type should be persisted.
enum EnumType {
  
  /// Persist enumerated type property or field as an integer.
  ORDINAL,
  
  /// Persist enumerated type property or field as a string.
  STRING
}

/// Specifies that a persistent property or field should be persisted
/// as a enumerated type. The Enumerated annotation may be used in conjunction
/// with the Basic annotation, or in conjunction with the ElementCollection
/// annotation when the element collection value is of basic type.
/// If the enumerated type is not specified or the Enumerated annotation
/// is not used, the EnumType value is assumed to be ORDINAL.
class Enumerated {
  /// Defines mapping for enumerated types. The constants of this enumerated type
  /// specify how a persistent property or field of an
  /// enumerated type should be persisted.
  final EnumType enumType;
  const Enumerated([
    this.enumType = EnumType.ORDINAL
  ]);
}

/// Specifies that a persistent property or field should be persisted
/// as a enumerated type. The Enumerated annotation may be used in conjunction
/// with the Basic annotation, or in conjunction with the ElementCollection
/// annotation when the element collection value is of basic type.
/// If the enumerated type is not specified or the Enumerated annotation
/// is not used, the EnumType value is assumed to be ORDINAL.
const Enumerated enumerated = Enumerated();


/// Used to specify the handling of foreign key constraints when schema
/// generation is in effect. If this annotation is not specified,
/// the persistence provider's default foreign key strategy will be used.
/// The ConstraintMode value is used to specify whether foreign key constraints
/// should be generated.
/// The syntax used in the foreignKeyDefinition element should follow the SQL
/// syntax used by the target database for foreign key constraints.
/// For example, this may be similar the following:
/// FOREIGN KEY ( <COLUMN expression> {, <COLUMN expression>}... )
/// REFERENCES <TABLE identifier> [
///     (<COLUMN expression> {, <COLUMN expression>}... ) ]
/// [ ON UPDATE <referential action> ]
/// [ ON DELETE <referential action> ]
/// When the ConstraintMode value is CONSTRAINT, but the foreignKeyDefinition
/// element is not specified, the provider will generate foreign key constraints
/// whose update and delete actions it determines most appropriate for the join
/// column(s) to which the foreign key annotation is applied.
class ForeignKey {
  
  /// The foreign key constraint definition.
  final String foreignKeyDefinition;
  
  /// The name of the foreign key constraint.
  final String name;

  /// todo
  // final ConstraintMode constraintMode;
  
  const ForeignKey({
    this.foreignKeyDefinition = "",
    this.name = ""
  });
}


/// Used to specify the handling of foreign key constraints when schema
/// generation is in effect. If this annotation is not specified,
/// the persistence provider's default foreign key strategy will be used.
/// The ConstraintMode value is used to specify whether foreign key constraints
/// should be generated.
/// The syntax used in the foreignKeyDefinition element should follow the SQL
/// syntax used by the target database for foreign key constraints.
/// For example, this may be similar the following:
/// FOREIGN KEY ( <COLUMN expression> {, <COLUMN expression>}... )
/// REFERENCES <TABLE identifier> [
///     (<COLUMN expression> {, <COLUMN expression>}... ) ]
/// [ ON UPDATE <referential action> ]
/// [ ON DELETE <referential action> ]
/// When the ConstraintMode value is CONSTRAINT, but the foreignKeyDefinition
/// element is not specified, the provider will generate foreign key constraints
/// whose update and delete actions it determines most appropriate for the join
/// column(s) to which the foreign key annotation is applied.
const ForeignKey foreignKey = ForeignKey();


/// Defines the types of primary key generation strategies.
enum GenerationType {
  
  /// Indicates that the persistence provider should pick an appropriate
  /// strategy for the particular database.
  AUTO,
  
  /// Indicates that the persistence provider must assign primary keys
  /// for the entity using a database identity column.
  IDENTITY,
  
  /// Indicates that the persistence provider must assign primary
  /// keys for the entity using a database sequence.
  SEQUENCE,
  
  /// Indicates that the persistence provider must assign primary keys
  /// for the entity using an underlying database table to ensure uniqueness.
  TABLE
}

/// Provides for the specification of generation strategies
/// for the values of primary keys. The GeneratedValue annotation may be applied
/// to a primary key property or field of an entity or mapped superclass in
/// conjunction with the Id annotation. The use of the GeneratedValue
/// annotation is only required to be supported for simple primary keys. Use of
/// the GeneratedValue annotation is not supported for derived primary keys.
class GeneratedValue {

  /// The name of the primary key generator to use as specified in the
  /// SequenceGenerator or TableGenerator annotation. Defaults to the id
  /// generator supplied by persistence provider.
  final String generator;

  /// The primary key generation strategy that the persistence provider
  /// must use to generate the annotated entity primary key.
  final GenerationType strategy;
  
  const GeneratedValue({
    this.strategy = GenerationType.AUTO,
    this.generator = ""
  });
}


/// Provides for the specification of generation strategies
/// for the values of primary keys. The GeneratedValue annotation may be applied
/// to a primary key property or field of an entity or mapped superclass in
/// conjunction with the Id annotation. The use of the GeneratedValue
/// annotation is only required to be supported for simple primary keys. Use of
/// the GeneratedValue annotation is not supported for derived primary keys.
const GeneratedValue generatedValue = GeneratedValue();


/// The mapped column for the primary key of the entity is assumed to be the
/// primary key of the primary table. If no Column annotation is specified,
/// the primary key column name is assumed to be the name of the primary
/// key property or field.
class Id {
  const Id();
}

/// The mapped column for the primary key of the entity is assumed to be the
/// primary key of the primary table. If no Column annotation is specified,
/// the primary key column name is assumed to be the name of the primary
/// key property or field.
const Id id = Id();

/// Used in schema generation to specify creation of an index.
/// Note that it is not necessary to specify an index for a primary key,
/// as the primary key index will be created automatically.
/// The syntax of the columnList element is a column_list, as follows:
///
///    column::= index_column [,index_column]*
///    index_column::= column_name [ASC | DESC]
///
/// If ASC or DESC is not specified, ASC (ascending order) is assumed.
class Index {

  /// The names of the columns to be included in the index, in order.
  final String columnList;
 
  /// The name of the index; defaults to a provider-generated name.
  final String name;
  
  /// Whether the index is unique.
  final bool unique;
  
  const Index({
    @required this.columnList,
    this.unique = false,
    this.name = "",
  });
}


/// Defines inheritance strategy options.
enum InheritanceType {
  
  /// A strategy in which fields that are specific to a subclass are mapped to
  /// a separate table than the fields that are common to the parent class,
  /// and a join is performed to instantiate the subclass.
  JOINED,
  
  /// A single table per class hierarchy.
  SINGLE_TABLE,
  
  /// A table per concrete entity class.
  TABLE_PER_CLASS
}


/// Specifies the inheritance strategy to be used for an entity class hierarchy.
/// It is specified on the entity class that is the root of the entity class
/// hierarchy. If the Inheritance annotation is not specified or if no
/// inheritance type is specified for an entity class hierarchy,
/// the SINGLE_TABLE mapping strategy is used.
class Inheritance {
  final InheritanceType inheritanceType;

  const Inheritance({
    this.inheritanceType = InheritanceType.SINGLE_TABLE
  });
}

/// Specifies the inheritance strategy to be used for an entity class hierarchy.
/// It is specified on the entity class that is the root of the entity class
/// hierarchy. If the Inheritance annotation is not specified or if no
/// inheritance type is specified for an entity class hierarchy,
/// the SINGLE_TABLE mapping strategy is used.
const Inheritance inheritance = Inheritance();